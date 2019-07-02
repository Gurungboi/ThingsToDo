//
//  LoginViewController.swift
//  ThingsToDo
//
//  Created by Sunil Gurung on 23/6/19.
//  Copyright © 2019 Sunil Gurung. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
}

