//
//  ViewController.swift
//  OtusHW_API_Layer
//
//  Created by Albert Fayzullin on 01.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var getUsers: UIButton!
    @IBOutlet weak var sendPost: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func getUsers(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) {
            (data,_,_) in
            guard let data = data else { return }
        do {
//            let json = try JSONSerialization.jsonObject(with: data, options: [])
//            print(json)
            let users = try JSONDecoder().decode([User].self, from: data)
            print("text")
            for user in users {
                print(user.email)
            }
        }
        catch {
            
        }
    }
        task.resume()
    }
    
    
    
    @IBAction func sendPost(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        let postDictionary = ["userID": "22",
//                              "id": "1",
//                              "title": "myTitle",
//                              "body": "myBody"]
        let newPost = Post (userId: 1, id: 22, title: "myTitle", body: "myBody")
        
        do {
//            let jsonBody = try JSONSerialization.data(withJSONObject: postDictionary, options: [])
//            request.httpBody = jsonBody
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
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
                let sendPost = try JSONDecoder().decode(Post.self, from: data)
                print(sendPost)
            }
            catch {
                
            }
        }
        task.resume()
    }
}

