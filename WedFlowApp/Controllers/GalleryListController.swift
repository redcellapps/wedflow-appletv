//
//  GalleryListController.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 29/06/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class GalleryListController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    @IBOutlet weak var tvCode: UILabel!
    @IBOutlet weak var noGalleries: UILabel!
    let reuseIdentifier = "GalleryCell"
    
    let galleryURL = "https://wedflow.co/api/galleries"
    var token = String()
    var name = String()
    var galleries = Galleries()
    var galleriesTimer : Timer?
    var spinner = UIActivityIndicatorView()
    
    
    override func loadView() {
        super.loadView()
        self.showSpinner()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menuPressRecognizer = UITapGestureRecognizer()
        menuPressRecognizer.addTarget(self, action: #selector(self.menuButtonAction))
        menuPressRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]
        self.view.addGestureRecognizer((menuPressRecognizer))
//        galleriesTimer?.invalidate()
        self.setDefaults()
        refreshGalleries()
    }

    
    @objc func menuButtonAction() {
        menuButtonPressPop(popTitle: "Exit VidFlow TV?", popDesc: "Do you really want to exit VidFlow TV?")
//        menuButtonPressPop(popTitle: "Do you want to close the VidFlow?", popDesc: "If you want to close your app press and hold 'Menu' button on your remote.")
    }

    @objc func refreshGalleries() {
        getGalleries { (galleries) in self.galleries = galleries
        self.galleryCollectionView.reloadData()
            if galleries.count == 0 {
                self.noGalleries.isHidden = false
            }
            else {
                self.noGalleries.isHidden = true
                
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        galleriesTimer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(self.refreshGalleries), userInfo: nil, repeats: true)
        addFocus()
//        setNeedsFocusUpdate()
//        updateFocusIfNeeded()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        galleriesTimer?.invalidate()
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        if (self.logoutButton.isFocused)
        {
            self.logoutButton.setTitle("   Logout", for: .normal)
        }
        else
        {
            self.logoutButton.setTitle(("  " + self.name), for: .normal)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.galleries.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! GalleryCollectionViewCell
        cell.galleryImage.sd_setImage(with: URL(string: (self.galleries[indexPath.item].coverPhoto?.thumbs?.md) ?? ""), completed: nil)
        print (self.galleries[indexPath.item].coverPhoto?.thumbs?.md)
        cell.galleryTitle.text = self.galleries[indexPath.item].title
        if self.galleries[indexPath.item].type == "video" {
            cell.galleryType.text = "VIDEO"
        }
        if self.galleries[indexPath.item].type == "collection" {
            cell.galleryType.text = "ALBUM"
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    // handle tap events
        if galleries[indexPath.item].type == "video" {
            let singleVideoViewController = self.storyboard?.instantiateViewController(withIdentifier: "SingleVideo") as! SingleVideoViewController
//            self.present(singleVideoViewController, animated: true, completion: nil)
            singleVideoViewController.gallery = galleries[indexPath.item]
            self.navigationController?.pushViewController(singleVideoViewController, animated: true)
            self.dismiss(animated: false, completion: nil)
        }
        if galleries[indexPath.item].type == "collection" {
                    let singleVideoGalleryViewController = self.storyboard?.instantiateViewController(withIdentifier: "AlbumViewController") as! AlbumViewController
        //            self.present(singleVideoViewController, animated: true, completion: nil)
                    singleVideoGalleryViewController.gallery = galleries[indexPath.item]
                    self.navigationController?.pushViewController(singleVideoGalleryViewController, animated: true)
                    self.dismiss(animated: false, completion: nil)
                }
        
    }
    
    
    func addFocus() {
        addFocusGuide(from: galleryCollectionView, to: logoutButton, direction: .top)
    }
    
    func logout() {
        UserDefaults.standard.setValue("false", forKey: "loggedIn")
        UserDefaults.standard.synchronize()
        let loginViewController = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! ViewController
        self.navigationController?.pushViewController(loginViewController, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func setDefaults() {
        let defaultValues = UserDefaults.standard
        self.name = defaultValues.string(forKey: "username") ?? "Guest"
        self.noGalleries.isHidden = true
        if self.name != "" {
            logoutButton.setTitle(self.name, for: .normal)
            logoutButton.setTitle("Logout", for: .focused)
        tvCode.text = defaultValues.string(forKey: "tvcode") ?? "000000"
        print (self.name)
        }
        else {
            //logoutButton.setTitle("Logout", for: .focused)
        }
        self.token = defaultValues.string(forKey: "token")!
            if self.token != "" {
                print (self.token)
            }
        else{
            self.logout()
        }
    }

    func getGalleries(completion: @escaping ([Gallery]) -> ()) {
        let header : HTTPHeaders = ["x-access-token": token]
        AF.request(self.galleryURL, method: .get, headers: header).response{
            responseData in
            guard let data = responseData.data else {return}
            do {
                let galleries = try JSONDecoder().decode([Gallery].self, from: data)
                DispatchQueue.main.async {
                    completion (galleries)
                    //self.addFocus()
                    self.removeSpinner()
                }
            }
            catch {
                self.showError(errorTitle: "NETWORK ERROR", errorDesc: error.localizedDescription)
                print ("ERROR DECODING GALLERIES GALLERIES")
            }
        }
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        logOutpop(popTitle: "Logout", popDesc: "Do you really want to logout?")
    }
    func logOutpop (popTitle: String, popDesc: String){
        let logOutPop = UIAlertController(title: popTitle, message: popDesc, preferredStyle: .actionSheet)
        logOutPop.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: "Logout"), style: .default, handler: { _ in
            self.logout()
        }))
        logOutPop.addAction(UIAlertAction(title: NSLocalizedString("No", comment: "Dismiss"), style: .default, handler: { _ in
            print ("Logout Dismiss")
        }))
        self.present(logOutPop, animated: true, completion: nil)
    }
    func menuButtonPressPop (popTitle: String, popDesc: String){
        let menuPopUp = UIAlertController(title: popTitle, message: popDesc, preferredStyle: .actionSheet)
        menuPopUp.addAction(UIAlertAction(title: NSLocalizedString("Exit", comment: "Exit App"), style: .default, handler: { _ in
            let app = UIApplication.shared
            app.perform(#selector(URLSessionTask.suspend))
//            self.logout()
        }))
        menuPopUp.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Dismiss"), style: .default, handler: { _ in
            print ("Exit Dismiss")
        }))
        self.present(menuPopUp, animated: true, completion: nil)
        
//        let menuPopUp = UIAlertController(title: popTitle, message: popDesc, preferredStyle: .actionSheet)
//        menuPopUp.addAction(UIAlertAction(title: NSLocalizedString("Yes", comment: "Logout"), style: .default, handler: { _ in
//            self.logout()
//        }))
//        menuPopUp.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "Dismiss"), style: .default, handler: { _ in
//            print ("Logout Dismiss")
//        }))
//        self.present(menuPopUp, animated: true, completion: nil)
    }
}
extension UIImageView {
    func loadImge(withUrl url: URL) {
           DispatchQueue.global().async { [weak self] in
               if let imageData = try? Data(contentsOf: url) {
                   if let image = UIImage(data: imageData) {
                       DispatchQueue.main.async {
                           self?.image = image
                       }
                   }
               }
           }
       }
}
