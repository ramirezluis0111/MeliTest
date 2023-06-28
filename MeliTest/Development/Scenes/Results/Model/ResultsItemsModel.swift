//
//  ResultsItemsModel.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

import Foundation

struct ResultsItemsModel: Codable {
    let paging: PagingInfo?
    let results: [ItemModel]?
}

struct PagingInfo: Codable {
    let total: Int?
    let primaryResults: Int?
    let offset: Int?
    let limit: Int?
}

struct ItemModel: Codable {
    // id producto
    let id: String?
    // Titulo
    let title: String?
    // Nuevo - usado
    let condition: String?
    // Picture
    let thumbnail: String?
    // id thumbnail
    let catalogProductID: String?
    let permalink: URL?
    // Valor del producto
    let price: Double?
    // cantidad de productos que se vendieron
    let soldQuantity: Int?
    // cantidad e productos que hay
    let availableQuantity: Int?
}
