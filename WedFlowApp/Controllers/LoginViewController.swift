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
    @IBOutlet weak var loginLabelText: UILabel!
    
    let baseURL = "https://wedflow.co/api/"
    let appLoginUrl = "https://wedflow.co/api/login-tv"
    let userURL = "https://wedflow.co/api/user/me"
    let registerURL = "https://wedflow.co/api/register-tv"
    let galleryURL = "https://wedflow.co/api/galleries"
    
    //the defaultvalues to store user data
    let userData = UserDefaults.standard
    var tvCodeParam = "000000"
    var parameters: Parameters!
    var tvCodeTimer : Timer?
    var token : String!
    var galleries = Galleries()


    override func viewDidLoad() {
        super.viewDidLoad()
        generateTvCode()
        setTvCode()
        registerTv()
        tvCodeTimer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(loginWithTvCode), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
        if String(describing: UserDefaults.standard.string(forKey: "loggedIn") ?? "false") == "true" {
              loginWithTvCode()
            }
    }
    
    @objc func generateTvCode() {
        if userData.string(forKey: "tvcode") == nil {
            let uid = UUID().uuidString
            let tvCode = String(uid.suffix(6))
            self.userData.set(tvCode, forKey: "tvcode")
            self.tvCodeParam = String(describing: userData.string(forKey: "tvcode")!).lowercased()
        }
        else {
            self.tvCodeParam = String(describing: userData.string(forKey: "tvcode")!).lowercased()
        }
//        let param: Parameters = ["tvcode": self.tvCodeParam]
//        AF.request(registerURL, method: .post, parameters: param).validate().responseJSON
//        {
//            response in
//            switch response.result {
//            case let .success(result):
//                let jsonData = result as! NSDictionary
//                let token = jsonData.value(forKey: "accessCode") as! String
//                print ("TV IS REGISTERED")
//                print ("TOKEN = \(token)")
//
//            case let.failure(error):
//                print ("PLEASE REGISTER TV FIRST")
//                print ("TOKEN ERROR \(error)")
//            }
//        }
    }
    
    func setTvCode() {
        if let tvCodeText = userData.string(forKey: "tvcode"){
            self.tvCode.text = tvCodeText
    }
        else{
            self.tvCode.text = "No TV Code!"
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        //getting the username and password
        self.parameters=[
//                        "email":"weddingflixco@gmail.com",
//                        "password":"hello123",
//                        "tvCode":"brz1js",
            
            "email":userEmail.text!,
            "password":userPassword.text!,
            "tvCode":self.tvCodeParam
        ]
        //making a post request
        if self.parameters["email"] as! String != "" && parameters["password"] as! String != ""{
            self.tvCodeTimer?.invalidate()
            loginWithEmail()
        }
        else {
        showError(errorTitle: "Invalid Username or Password", errorDesc: "Please enter valid Username and password")

        }
    }
    func loginWithEmail(){
        AF.request(appLoginUrl, method: .post, parameters: self.parameters).validate().responseJSON
        { [self]
            response in
            switch response.result {
            case let .success(result):
                let jsonData = result as! NSDictionary
                let token = jsonData.value(forKey: "accessCode") as! String
                self.token = token
                debugPrint ("TOKEN = \(token)")
                let header : HTTPHeaders = ["x-access-token": token]
                
                AF.request(self.userURL, method: .get, headers: header).validate().responseJSON {
                    response in
                    switch response.result {
                    case let .success(result):
                        print ("token \(token)")
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
                        showError(errorTitle: "User Error", errorDesc: "Please register!")
                        print ("USER ERROR \(error)")
                    }
                }
            //                    }
            case let.failure(error):
                let errorDescription = error.failureReason
                showError(errorTitle: "Login Error", errorDesc: errorDescription ?? "Error")
                print ("TOKEN ERROR \(error)")
            }
        }
    }
    @objc func registerTv() {
        if String(describing: UserDefaults.standard.string(forKey: "token") ?? "") == "" {
        let param: Parameters = ["tvCode": self.tvCodeParam]
        print ("MOMO PARAMETAR = \(param)")
        print ("MOMO PARAMETAR URL = \(registerURL)")
        AF.request(registerURL, method: .post, parameters: param).validate().responseJSON
        { [self]
            response in
            switch response.result {
            case let .success(result):
                let jsonData = result as! NSDictionary
                let token = jsonData.value(forKey: "accessCode") as! String
                self.token = token
                UserDefaults.standard.setValue(token, forKey: "token")
                print ("TV IS REGISTERED")
                print ("TOKEN = \(token)")
                if (String(describing: UserDefaults.standard.string(forKey: "loggedIn") ?? "false")) == "true" {
                      loginWithTvCode()
                }

            case let.failure(error):
                showError(errorTitle: "Error Registering TV", errorDesc: "Please register your Apple TV with Code provided")
                print ("PLEASE REGISTER TV FIRST")
                print ("TOKEN ERROR \(error)")
                }
            }
        }
        else {
            // self.token = String(describing: UserDefaults.standard.string(forKey: "token") ?? "")
            
            //loginWithTvCode()
        }
    }
    func openGalleries() {
        let galleryViewController = self.storyboard?.instantiateViewController(withIdentifier: "GalleryList") as! GalleryListController
        self.navigationController?.pushViewController(galleryViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func loginWithTvCode(){
        //
        getGalleries { (galleries) in self.galleries = galleries
            if galleries.count != 0 {
                let param: Parameters = ["tvCode": self.tvCodeParam]
                self.tvCodeTimer?.invalidate()
                UserDefaults.standard.setValue("true", forKey: "loggedIn")
                AF.request(self.registerURL, method: .post, parameters: param).validate().responseJSON
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
                                let jsonData = result as? NSDictionary
                                print ("USER = \(jsonData)")
                                let name = "Guest"
                                self.userData.set(token, forKey: "token")
        //                        //switching the screen
                                self.tvCodeTimer?.invalidate()
                                let galleryViewController = self.storyboard?.instantiateViewController(withIdentifier: "GalleryList") as! GalleryListController
                                self.navigationController?.pushViewController(galleryViewController, animated: true)
                                self.dismiss(animated: false, completion: nil)

                            case let.failure(error):
                                print ("USER ERROR \(error)")
                            }
                        }
                    case let.failure(error):
                        self.showError(errorTitle: "Error Registering TV", errorDesc: "Please register your Apple TV with Code provided")
                        print ("TOKEN ERROR \(error)")
                    }
                }
            }
            else {
                print ("NO GALLERIES ADDED TO TV")
            }
        }

        }
    func getGalleries(completion: @escaping ([Gallery]) -> ()) {
        let token = String(describing: UserDefaults.standard.string(forKey: "token") ?? "")
        let header : HTTPHeaders = ["x-access-token": token]
        AF.request(self.galleryURL, method: .get, headers: header).response{
            responseData in
            guard let data = responseData.data else {return}
            do {
                self.galleries = try JSONDecoder().decode([Gallery].self, from: data)
                DispatchQueue.main.async { [self] in
                    completion (galleries)
                }
            }
            catch {
                self.showError(errorTitle: "NETWORK ERROR", errorDesc: error.localizedDescription)
                print ("ERROR DECODING GALLERIES")
            }
        }
        
    }
}
