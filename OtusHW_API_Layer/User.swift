//
//  User.swift
//  OtusHW_API_Layer
//
//  Created by Albert Fayzullin on 16.08.2022.
//

import Foundation

struct User: Encodable, Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Company: Encodable, Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
}

struct Address: Encodable, Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Encodable, Decodable {
    let lat: String
    let lng: String
}
