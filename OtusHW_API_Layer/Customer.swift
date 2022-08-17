//
//  Customer.swift
//  OtusHW_API_Layer
//
//  Created by Albert Fayzullin on 16.08.2022.
//

import Foundation

struct Customer {
    let name: String
    let age: Int
    let address: Address1
}

struct Address1 {
    let street: String
    let city: String
}
