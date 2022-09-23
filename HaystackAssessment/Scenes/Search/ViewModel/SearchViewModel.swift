//
//  SearchViewModel.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 20-09-22.
//

import UIKit
import JNetworking

class SearchViewModel {

    // MARK: - Properties

    var allResults = [Resource?]()
    var searchData: DataBiding<[Resource?]> = DataBiding([])
    var photos: DataBiding<Photo?> = DataBiding(nil)


    // MARK: - Methods

    func searchRequest(with text: String) {
        let url = (APIRequest.baseURL + APIRequest.photos + APIRequest.search).replacingOccurrences(of: "{QUERY-SEARCH}", with: text)
        let client = JNWebClient<Photo, JNEmpty>()
        let request = JNRequest(url: URL(string: url)!)

        client.request(request: request) { data in
            switch data {
            case .success(let data):
                data.value.photos.photo.forEach { [weak self] curent in
                    self?.fetchResources(with: curent?.id)
                }
                self.photos.value = data.value
            case .failure(let error):
                print(error.errorDescription!)
            }
        }

    }

    func fetchResources(with id: String?) {
        guard let id = id else { return }

        let url = (APIRequest.baseURL + APIRequest.photos + APIRequest.resources).replacingOccurrences(of: "{PHOTOID}", with: id)
        let client = JNWebClient<Resource, JNEmpty>()
        let request = JNRequest(url: URL(string: url)!)

        // remove all data to refresh the information
        self.allResults = []

        client.request(request: request) { [weak self] data in
            switch data {
            case .success(let data):
                self?.allResults.append(data.value)
                if self?.allResults.count == 30 {
                    self?.searchData.value = self!.allResults
                }
            case .failure(let error):
                print(error.errorDescription!)
            }
        }
    }


    func goToShowSearchResult(searchText: String?, tabBar: UITabBarController?) {

        guard let searchText = searchText, let tabBar = tabBar else { return }
        searchRequest(with: searchText)

        // Get an instance for ViewController
        let navigationBar = tabBar.viewControllers?.first as? UINavigationController
        let viewController = navigationBar?.viewControllers.first as? MainViewController
        viewController?.searchFlag = true
        viewController?.searchViewModel = self
        viewController?.titleHeader = "Search Results for " + searchText


        // Go to Feed tarBar
        tabBar.selectedIndex = 0

    }
    
}
