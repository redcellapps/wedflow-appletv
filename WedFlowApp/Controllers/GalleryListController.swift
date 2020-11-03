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
    
    let reuseIdentifier = "GalleryCell"
    
    let galleryURL = "http://stage-tv.wedflow.co/api/galleries"
    var token = String()
    var name = String()
    var galleries = Galleries()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaults()
        getGalleries { (galleries) in self.galleries = galleries
            self.galleryCollectionView.reloadData()
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addFocus()
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.galleries.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! GalleryCollectionViewCell
        
        cell.galleryImage.sd_setImage(with: URL(string: (self.galleries[indexPath.item].coverPhoto?.thumbs?.md) ?? ""), completed: nil)
        cell.galleryTitle.text = self.galleries[indexPath.item].title
        if self.galleries[indexPath.item].type == "video" {
            cell.galleryType.text = "VIDEO"
        }
        if self.galleries[indexPath.item].type == "collection" {
            cell.galleryType.text = "ALBUM"
        }
        //cell.myLabel.text = self.items[indexPath.item]

        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    // handle tap events
    print("You selected cell #\(indexPath.item)!")
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
        
        //UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        let loginViewController = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as! ViewController
        self.navigationController?.pushViewController(loginViewController, animated: true)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func setDefaults() {
        let defaultValues = UserDefaults.standard
        self.name = defaultValues.string(forKey: "username") ?? "User"
        if self.name != "" {
        logoutButton.setTitle(self.name, for: .normal)
        tvCode.text = defaultValues.string(forKey: "tvcode") ?? "000000"
        print (self.name)
        }
        else {
            logoutButton.setTitle("Logout", for: .normal)
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
                }
            }
            catch {
                print ("ERROR DECODING")
            }
        }
        
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        logout()
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
