//
//  Network.swift
//  OtusHW_API_Layer
//
//  Created by Albert Fayzullin on 20.08.2022.
//

import Foundation

class Network {
    func sendPost() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let newPost = Post (userId: 1, id: 22, title: "myTitle", body: "myBody")
    
    do {
        let jsonBody = try JSONEncoder().encode(newPost)
        request.httpBody = jsonBody
    }
    catch {
        
    }
    let session = URLSession.shared
    let task = session.dataTask(with: request) {
        (data,_,_) in
        guard let data = data else {
            return
        }
        do {
            let sendPost = try JSONDecoder().decode(Post.self, from: data)
            print(sendPost)
        }
        catch {
            
        }
    }
    task.resume()
}
    func getUserInfo() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) {
            (data,_,_) in
            guard let data = data else { return }
        do {
            let users = try JSONDecoder().decode([User].self, from: data)
            for user in users {
                print(user.email)
            }
        }
        catch {
            
        }
    }
        task.resume()
    }
    
}


