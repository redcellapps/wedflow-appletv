//
//  SingleVideoGalleryViewController.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 30/06/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class SingleVideoGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var studioLogo: UIImageView!
    @IBOutlet weak var studioName: UILabel!
    @IBOutlet weak var galleriesButton: UIButton!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var sideImage: UIImageView!
    @IBOutlet weak var sideTitle: UILabel!
    @IBOutlet weak var setTitle: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var sideTableView: UITableView!
    @IBOutlet weak var multiVideoCollectionView: UICollectionView!
    
    
    let token = UserDefaults.standard.value(forKey: "token") as? String
    
    let reuseIdentifier = "MultiVideoCell"
    var gallery: Gallery!
    var videos: [Media]!
    var galleryID: String!
    var selectedCell = 0
    var set: Set!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideTableView.delegate = self
        sideTableView.dataSource = self
        multiVideoCollectionView.dataSource = self
        multiVideoCollectionView.delegate = self
        self.prepareView()
        self.multiVideoCollectionView.reloadData()
//        getGallery { (galleries) in self.gallery = galleries
//            self.prepareView()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        self.multiVideoCollectionView.reloadData()
        addFocus()
        
    }
    
    @IBAction func galleriesButtonTap(_ sender: Any) {
        let galleryViewController = self.storyboard?.instantiateViewController(withIdentifier: "GalleryList") as! GalleryListController
        self.navigationController?.pushViewController(galleryViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    
    func prepareView() {
        sideView.isHidden = true
        self.backgroundImage.sd_setImage(with: URL(string: (self.set.coverPhoto?.thumbs?.lg) ?? ""), completed: nil)
        self.backgroundImage.layer.opacity = 0.3
        studioLogo.sd_setImage(with: URL(string: (self.gallery.studio?.logo?.url) ?? ""))
        studioLogo.layer.masksToBounds = true
        studioLogo.layer.cornerRadius = studioLogo.bounds.width / 2
        studioLogo.layer.borderWidth = 2
        studioLogo.layer.borderColor = UIColor.lightGray.cgColor
        studioName.text = gallery.studio?.name
        setTitle.text = set.title
        galleriesButton.layer.cornerRadius = 10
        galleriesButton.clipsToBounds = true
        
        sideImage.sd_setImage(with: URL(string: (self.set.coverPhoto?.thumbs?.md) ?? ""), completed: nil)
        sideTitle.text = set.title
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.set.media?.count ?? 0
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MultiVideoCell
        
        cell.cellBackGround.sd_setImage(with: URL(string:
            (self.set.media?[indexPath.item].coverPhoto?.thumbs?.md) ?? ""), completed: nil)
        cell.cellTitle.text = self.set.media?[indexPath.item].title!
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        selectedCell = indexPath.item

        if set.media?[selectedCell].scenes?.count ?? 0 != 0 {
            self.sideTableView.reloadData()
            sideView.isHidden = false
        }
        else {
            let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayerViewController") as!
            VideoPlayerViewController
            //            self.present(singleVideoViewController, animated: true, completion: nil)
            let video = set?.media
            playerViewController.video = video
            playerViewController.sceneTime = 0
            self.navigationController?.pushViewController(playerViewController, animated: true)
            self.dismiss(animated: false, completion: nil)
        }
            
    }

    func getGallery(completion: @escaping (Gallery) -> ()) {
        let header : HTTPHeaders = ["x-access-token": token!]
        let galleryURL = "http://stage-tv.wedflow.co/api/galleries/\(gallery.id!)?expand=sets"
        print ("MOMO \(galleryURL)")
        
        AF.request(galleryURL, method: .get, headers: header).response{
            responseData in
            debugPrint ("MOMO GALLERY \(responseData.debugDescription)")
            
            guard let data = responseData.data else {return}
            do {
                let galleries = try JSONDecoder().decode(Gallery.self, from: data)
                DispatchQueue.main.async {
                    completion (galleries)
                }
            }
            catch {
                print ("ERROR DECODING")
            }
        }
        
    }
    func addFocus() {
        addFocusGuide(from: backButton, to: galleriesButton, direction: .top)
        addFocusGuide(from: galleriesButton, to: backButton, direction: .left)
    }
    
}

extension SingleVideoGalleryViewController: UITableViewDelegate {
    func tableView(_ sideTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayerViewController" ) as! VideoPlayerViewController
        //            self.present(singleVideoViewController, animated: true, completion: nil)
        playerViewController.video = gallery.sets?[0].media
        playerViewController.sceneTime = set.media?[selectedCell].scenes?[indexPath.row].at ?? 0
                    self.navigationController?.pushViewController(playerViewController, animated: true)
                    self.dismiss(animated: false, completion: nil)
    }
}
extension SingleVideoGalleryViewController: UITableViewDataSource {
    func tableView(_ sideTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if set.media?[selectedCell].scenes != nil {
        return set.media?[selectedCell].scenes?.count ?? 0
        }
        else {
            return 0
        }
    }
    func tableView(_ sideTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sideTableView.dequeueReusableCell(withIdentifier: "sideViewCell", for: indexPath)
        if gallery.sets != nil {
            let cellButtonTitle = set.media?[selectedCell].scenes?[indexPath.row].title
            
            cell.textLabel?.text = cellButtonTitle ?? ""
            
        }
        else {
            cell.textLabel?.text = ""
        }
        cell.textLabel?.textAlignment = .center
        return cell
    }
}

