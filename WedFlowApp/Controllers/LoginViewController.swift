//
//  ViewController.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 29/06/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var tvCode: UILabel!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    let baseURL = "http://stage-tv.wedflow.co/api/"
    let appLoginUrl = "http://stage-tv.wedflow.co/api/login-tv"
    let userURL = "http://stage-tv.wedflow.co/api/user/me"
    let registerURL = "http://stage-tv.wedflow.co/api/tv/register"
    //the defaultvalues to store user data
    let userData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTvCode()
        tvCode.text = String(userData.string(forKey: "tvcode") ?? "No TV Code")
        // Do any additional setup after loading the view.
    }
    
    func generateTvCode() {
        print ("MOMO1 \(String(describing: userData.string(forKey: "tvcode")))")
        if userData.string(forKey: "tvcode") == nil {
        let uid = UUID().uuidString
        let tvCode = String(uid.suffix(6))
        self.userData.set(tvCode, forKey: "tvcode")
        print ("MOMO2 \(String(describing: userData.string(forKey: "tvcode")))")
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        //getting the username and password
        let parameters: Parameters=[
//            "email":"shub.kansal@gmail.com",
//            "password":"shubham",
//            "tvCode":"brz1js"
            "email":userEmail.text!,
            "password":userPassword.text!,
            "tvCode": String(describing: userData.string(forKey: "tvcode"))
        ]
        
        //making a post request
        if parameters["email"] as! String != "" && parameters["password"] as! String != "" {
        AF.request(appLoginUrl, method: .post, parameters: parameters).validate().responseJSON
            {
                response in
                switch response.result {
                case let .success(result):
                    let jsonData = result as! NSDictionary
                    let token = jsonData.value(forKey: "accessCode") as! String
                    print ("TOKEN = \(token)")
                    let header : HTTPHeaders = ["x-access-token": token]
                    
                    AF.request(self.userURL, method: .get, headers: header).validate().responseJSON {
                        response in
                    switch response.result {
                    case let .success(result):
                        print ("token \(token)")
                        print ("MOMO RESULT \(result)")
                        let jsonData = result as! NSDictionary
                        print ("USER = \(jsonData)")
                        
                        let name = jsonData.value(forKey: "name") as! String
                        let email = jsonData.value(forKey: "email") as! String
                        let id = jsonData.value(forKey: "id") as! String
                        
                        let user = User (id: id, name: name, email: email)
                        
                        self.userData.set(id, forKey: "userid")
                        self.userData.set(name, forKey: "username")
                        self.userData.set(email, forKey: "useremail")
                        self.userData.set(token, forKey: "token")
                        //switching the screen
                        let galleryViewController = self.storyboard?.instantiateViewController(withIdentifier: "GalleryList") as! GalleryListController
                        self.navigationController?.pushViewController(galleryViewController, animated: true)
                        
                        self.dismiss(animated: false, completion: nil)
                        
                    case let.failure(error):
                        
                        print ("USER ERROR \(error)")
                    }
                    }
                case let.failure(error):
                    
                    print ("TOKEN ERROR \(error)")
                }
        }
    }
        else {
            let param: Parameters=["tvCode": String(describing: userData.string(forKey: "tvcode"))]
//            let param: Parameters=["tvCode": "brz1js"]
            print ("MOMO REGISTERTV URL: \(registerURL)")
            AF.request(registerURL, method: .post, parameters: param).validate().responseJSON
                {
                    response in
                    switch response.result {
                    case let .success(result):
                        let jsonData = result as! NSDictionary
                        let token = jsonData.value(forKey: "accessCode") as! String
                        print ("TOKEN = \(token)")
                        let header : HTTPHeaders = ["x-access-token": token]
                        
                        AF.request(self.userURL, method: .get, headers: header).validate().responseJSON {
                            response in
                        switch response.result {
                        case let .success(result):
                            print ("MOMO RESULT \(result)")
                            let jsonData = result as? NSDictionary
                            print ("USER = \(jsonData)")
                            
                            let name = jsonData?.value(forKey: "name") as? String
                            let email = jsonData?.value(forKey: "email") as? String
                            let id = jsonData?.value(forKey: "id") as? String
                            
//                            let user = User (id: id, name: name, email: email)
                            
                            self.userData.set(id, forKey: "userid")
                            self.userData.set(name, forKey: "username")
                            self.userData.set(email, forKey: "useremail")
                            self.userData.set(token, forKey: "token")
                            //switching the screen
                            let galleryViewController = self.storyboard?.instantiateViewController(withIdentifier: "GalleryList") as! GalleryListController
                            self.navigationController?.pushViewController(galleryViewController, animated: true)
                            
                            self.dismiss(animated: false, completion: nil)
                            
                        case let.failure(error):
                            
                            print ("USER ERROR \(error)")
                        }
                        }
                    case let.failure(error):
                        
                        print ("TOKEN ERROR \(error)")
                    }
            }
            
        }

}
}
