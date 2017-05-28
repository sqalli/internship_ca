//
//  ViewController.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 28/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        // Get the email from the user, and get the permissions
        button.readPermissions = ["email"]
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        loginButton.center = view.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

