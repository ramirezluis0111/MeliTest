//
//  MeliApis.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

enum MeliApis {
    // BaseUrl
    private static var baseApiUrl: String { "https://api.mercadolibre.com/"}

    // Search
    private static var searchInputPath: String { "sites/MLA/search?q=" }

    // Item data
    private static let itemPath = "items/"

    // Description Item
    private static let descriptionPath = "/description"

    static func searchItem(searchLabel: String) -> String {
        guard let searchLabelEncode = searchLabel.addingPercentEncoding(
            withAllowedCharacters: .urlQueryAllowed
        ) else { return "" }
        return "\(baseApiUrl)\(searchInputPath)\(searchLabelEncode)"
    }

    static func searchItemInfo(id: String) -> String {
        "\(baseApiUrl)\(itemPath)\(id)"
    }

    static func searchDescription(id: String) -> String {
        "\(baseApiUrl)\(itemPath)\(id)\(descriptionPath)"
    }
}
