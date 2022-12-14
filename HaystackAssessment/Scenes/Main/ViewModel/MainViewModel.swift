//
//  MainViewModel.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 09-09-22.
//

import Foundation
import JNetworking

class MainViewModel {

    // MARK: - Properties

    var allResults = [Resource?]()
    var data: DataBiding<[Resource?]> = DataBiding([])
    var photos: DataBiding<Photo?> = DataBiding(nil)
    var showLoading: DataBiding<Bool> = DataBiding(false)
    var error: DataBiding<Bool> = DataBiding(false)

    // MARK: - Methods

    func fetchPhotos() {
        let url = APIRequest.baseURL + APIRequest.photos + APIRequest.queryParams
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
                self.error.value = true
            }
        }
    }

    func fetchResources(with id: String?) {
        guard let id = id else { return }

        let url = (APIRequest.baseURL + APIRequest.photos + APIRequest.resources).replacingOccurrences(of: "{PHOTOID}", with: id)
        let client = JNWebClient<Resource, JNEmpty>()
        let request = JNRequest(url: URL(string: url)!)

        client.request(request: request) { [weak self] data in
            switch data {
            case .success(let data):
                self?.allResults.append(data.value)
                if self?.allResults.count == 30 {
                    self?.data.value = self!.allResults
                    self?.showLoading.value = true
                }
            case .failure(let error):
                print(error.errorDescription!)
                self?.error.value = true
            }
        }
    }

}
