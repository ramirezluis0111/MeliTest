//
//  RequestNetWorking.swift
//  MeliTest
//
//  Created by LuisR on 25/06/2023.
//

import Alamofire

class RequestNetWorking {
    var session: Session?

    init(sessionRequest: Session? = Session(configuration: URLSessionConfiguration.default)) {
        self.session = sessionRequest
    }

    func request<T: Decodable>(_ url: URL,
                               method: HTTPMethod = .get,
                               params: Parameters? = nil,
                               onSuccess: @escaping (T, HTTPURLResponse?) -> Void,
                               onFailure: @escaping (HTTPURLResponse?, ServiceError?) -> Void) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self else { return }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let request = session?.request(url,
                                           method: method,
                                           parameters: params,
                                           encoding: JSONEncoding.default)

            request?.responseDecodable(of: T.self, decoder: decoder) { response in
                switch response.result {
                case .success(let valueDTO):
                    onSuccess(valueDTO, response.response)
                case .failure(_):
                    let statusCode = response.response?.statusCode
                    onFailure(response.response, ServiceError(statusCode))
                }
            }
        }
    }

}
