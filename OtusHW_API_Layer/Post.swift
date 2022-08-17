//
//  Post.swift
//  OtusHW_API_Layer
//
//  Created by Albert Fayzullin on 16.08.2022.
//

import Foundation

struct Post: Encodable, Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
