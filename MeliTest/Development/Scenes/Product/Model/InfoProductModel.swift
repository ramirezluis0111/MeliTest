//
//  InfoProductModel.swift
//  MeliTest
//
//  Created by LuisR on 24/06/2023.
//

struct InfoProduct: Codable {
    let id: String?
    let title: String?
    let price: Double?
    let pictures: [Picture]?
}

struct Picture: Codable {
    let id: String?
    let url: String?
}
