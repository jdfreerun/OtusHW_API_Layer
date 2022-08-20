//
//  ViewController.swift
//  OtusHW_API_Layer
//
//  Created by Albert Fayzullin on 01.07.2022.
//

import UIKit

class ViewController: UIViewController {
    let network = Network()

    @IBOutlet weak var getUsers: UIButton!
    @IBOutlet weak var sendPost: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func getUsers(_ sender: Any) {
        network.getUserInfo()
    }
    
    @IBAction func sendPost(_ sender: Any) {
        network.sendPost()
}
}
