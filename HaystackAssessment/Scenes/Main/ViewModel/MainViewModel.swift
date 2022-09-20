//
//  MainViewModel.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 09-09-22.
//

import Foundation
import JNetworking

class MainViewModel {

    var allResults = [Resource?]()
    var data: DataBiding<[Resource?]> = DataBiding([])
    var photos: DataBiding<Photo?> = DataBiding(nil)


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
                if self?.allResults.count == 20 {
                    self?.data.value = self!.allResults
                }
            case .failure(let error):
                print(error.errorDescription!)
            }
        }
    }

}
