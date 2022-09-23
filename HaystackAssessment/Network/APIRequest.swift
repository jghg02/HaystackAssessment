//
//  APIRequest.swift
//  HaystackAssessment
//
//  Created by Josue Hernandez on 15-09-22.
//

struct APIRequest {
    static let APIKEY = "9d5554c5e355be65adc338067eeae362"
    static let baseURL = "https://api.flickr.com"
    static let photos = "/services/rest"
    static let queryParams = "?method=flickr.photos.getRecent&api_key=" + APIKEY + "&per_page=30&format=json&nojsoncallback=1"
    static let resources = "?method=flickr.photos.getSizes&api_key=" + APIKEY + "&photo_id={PHOTOID}&format=json&nojsoncallback=1"
    static let search = "?method=flickr.photos.search&api_key=" + APIKEY + "&tags={QUERY-SEARCH}&format=json&nojsoncallback=1"
}
