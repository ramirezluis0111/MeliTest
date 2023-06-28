//
//  ErrorsBuild.swift
//  MeliTest
//
//  Created by LuisR on 26/06/2023.
//

import Alamofire

enum ServiceError: Error {
    case requestError
    case timeOut
    case systemError

    init(_ response: Int?) {
        guard let response = response else {
            self = .systemError
            return
        }

        switch response {
        case 400...502:
            self = .requestError
        case 504:
            self = .timeOut
        default:
            self = .systemError
        }
    }
}

enum ErrorLottieType {
    case requestError
    case timeOut
    case systemError

    var stringValue: String {
        switch self {
        case .requestError, .systemError:
            return "lost-connection"
        case .timeOut:
            return "timeOut-Polar"
        }
    }

    init(error: ServiceError?) {
        switch error {
        case .requestError, .systemError:
            self = .requestError
        case .timeOut:
            self = .timeOut
        default:
            self = .systemError
        }
    }
}
