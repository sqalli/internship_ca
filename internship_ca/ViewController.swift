//
//  ViewController.swift
//  internship_ca
//
//  Created by Mohammed Tahri Sqalli on 28/05/2017.
//  Copyright © 2017 Al Akhawayn University. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        // Get the email from the user, and get the permissions
        button.readPermissions = ["email"]
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let showAlbumsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Albums", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        view.backgroundColor = UIColor.white
        navigationItem.title = "Facebook Login"
        
        if let token = FBSDKAccessToken.current() {
            fetchProfile()
        }
        
        setupSubviews()
        
        
    }
    
    func setupSubviews() {
        view.addSubview(loginButton)
        view.addSubview(userImageView)
        view.addSubview(nameLabel)
        view.addSubview(showAlbumsButton)
        
        
        showAlbumsButton.addTarget(self, action: "showAlbums", for: .touchUpInside)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": userImageView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-80-[v0]-80-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": showAlbumsButton]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-80-[v0]-80-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": loginButton]))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0(100)]-8-[v1(30)]-8-[v2(50)]-8-[v3(44)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": userImageView, "v1": nameLabel, "v2": loginButton, "v3": showAlbumsButton]))
        
        loginButton.delegate = self
    }
    
    func showAlbums() {
        
            let friendsController = FacebookAlbumPicker()
        
            self.navigationController?.pushViewController(friendsController, animated: true)
            self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }

    
    func fetchProfile() {
        let parameters = ["fields": "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: { (connection, user, requestError) -> Void in
            
            if requestError != nil {
                print(requestError)
                return
            }
            
            var _ = (user as AnyObject)["email"]! as? String
            let firstName = (user as AnyObject)["first_name"]! as? String
            let lastName = (user as AnyObject)["last_name"]! as? String
            
            self.nameLabel.text = "\(firstName!) \(lastName!)"
            
            var pictureUrl = URL(string: "")
            
            if let picture = (user as AnyObject)["picture"]! as? NSDictionary, let data = picture["data"] as? NSDictionary,let url = data["url"]! as? String {
                pictureUrl = URL(string: url)
            }
            
            let url = URLRequest(url: pictureUrl!)
            URLSession.shared.dataTask(with: url as URLRequest, completionHandler: {(data, response, error) -> Void in
                if error != nil {
                    print(error)
                    return
                }
                
                let image = UIImage(data: data!)
                DispatchQueue.main.async(execute: { () -> Void in
                    self.userImageView.image = image
                })
                
            }).resume()
            
        })
    }
    
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print ("Completed Login")
        fetchProfile()
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

