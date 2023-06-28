//
//  MeliServices.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import Alamofire

enum RequestType {
    case SearchItems
    case ItemInfo
    case DescriptionItem
}

class MeliServices {
    var services: RequestNetWorking?

    init(services: RequestNetWorking = RequestNetWorking()) {
        self.services = services
    }

    func getMeliRequest<T: Decodable>(itemSearch: String,
                                      requestType: RequestType,
                                      onSuccess: @escaping (T, HTTPURLResponse?) -> Void,
                                      onFailure: @escaping (HTTPURLResponse?, ServiceError?) -> Void) {

        var urlPath = ""
        switch requestType {
        case .SearchItems:
            urlPath = MeliApis.searchItem(searchLabel: itemSearch)
        case .ItemInfo:
            urlPath = MeliApis.searchItemInfo(id: itemSearch)
        case .DescriptionItem:
            urlPath = MeliApis.searchItemInfo(id: itemSearch)
        }

        if let url = URL(string: urlPath) {
            services?.request(url,
                              method: .get,
                              onSuccess: onSuccess,
                              onFailure: onFailure)
        }
    }
}
