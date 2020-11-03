//
//  SingleVideoViewController.swift
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


class SingleVideoViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var studioLogo: UIImageView!
    @IBOutlet weak var studioName: UILabel!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoSubtitle: UILabel!
    @IBOutlet weak var playFilmButton: UIButton!
    @IBOutlet weak var sceneButton: UIButton!
    @IBOutlet weak var galleriesButton: UIButton!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var sideImage: UIImageView!
    @IBOutlet weak var sideTitle: UILabel!
    @IBOutlet weak var sideTableView: UITableView!

    
    let token = UserDefaults.standard.value(forKey: "token") as? String
    var gallery: Gallery!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideTableView.delegate = self
        sideTableView.dataSource = self
        
        getGallery { (galleryFull) in self.gallery = galleryFull
            self.prepareView()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addFocus()
        
    }
    
    @IBAction func sceneButtonTap(_ sender: Any) {
        if sideView.isHidden == true {
            sideView.isHidden = false
        }
        else {
            sideView.isHidden = true
        }
    }
    @IBAction func galleriesButtonTap(_ sender: Any) {
        let galleryViewController = self.storyboard?.instantiateViewController(withIdentifier: "GalleryList") as! GalleryListController
        self.navigationController?.pushViewController(galleryViewController, animated: true)
        
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func playButton(_ sender: Any) {
        let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayerViewController") as!
            VideoPlayerViewController
        //            self.present(singleVideoViewController, animated: true, completion: nil)
        playerViewController.video = gallery.sets?[0].media
        playerViewController.sceneTime = 0
                    self.navigationController?.pushViewController(playerViewController, animated: true)
                    self.dismiss(animated: false, completion: nil)
    }
    
    func prepareView() {
        sideView.isHidden = true
        sceneButton.isHidden = true
        playFilmButton.isHidden = true
        self.backgroundImage.sd_setImage(with: URL(string: (self.gallery.coverPhoto?.thumbs?.lg) ?? ""), completed: nil)
        self.backgroundImage.layer.opacity = 0.3
        studioLogo.sd_setImage(with: URL(string: (self.gallery.studio?.logo?.url) ?? ""))
        studioLogo.layer.masksToBounds = true
        studioLogo.layer.cornerRadius = studioLogo.bounds.width / 2
        studioLogo.layer.borderWidth = 2
        studioLogo.layer.borderColor = UIColor.lightGray.cgColor
        studioName.text = gallery.studio?.name
        videoTitle.text = gallery.title
        videoSubtitle.text = gallery.subtitle
        galleriesButton.layer.cornerRadius = 10
        galleriesButton.clipsToBounds = true
        
//      playFilmButton.backgroundColor = UIColor(hexString: (gallery.style?.secondaryColor)!)
        sideImage.sd_setImage(with: URL(string: (self.gallery.coverPhoto?.thumbs?.md) ?? ""), completed: nil)
        sideTitle.text = gallery.title
        if ((gallery.sets?[0].media?.count) ?? 0) > 0 {
            playFilmButton.isHidden = false
        if ((gallery.sets?[0].media?[0].scenes?.count) ?? 0) > 0 {
            sideTableView.reloadData()
            sceneButton.setTitle("Select Scene", for: .normal)
            sceneButton.isHidden = false
        }
        }
    }
    
    func addFocus() {
        addFocusGuide(from: playFilmButton, to: galleriesButton, direction: .top)
        addFocusGuide(from: galleriesButton, to: playFilmButton, direction: .bottom)
        addFocusGuide(from: sideView, to: galleriesButton, direction: .top)
    }
    
    func getGallery(completion: @escaping (Gallery) -> ()) {
        let header : HTTPHeaders = ["x-access-token": token!]
        let galleryURL = "http://stage-tv.wedflow.co/api/galleries/\(gallery.id!)?expand=sets"
        AF.request(galleryURL, method: .get, headers: header).response{
            responseData in
            
            guard let data = responseData.data else {return}
            do {
                let galleryFull = try JSONDecoder().decode(Gallery.self, from: data)
                DispatchQueue.main.async {
                    completion (galleryFull)
                }
            }
            catch {
                print ("ERROR DECODING")
            }
        }
        
    }
}

extension SingleVideoViewController: UITableViewDelegate {
    func tableView(_ sideTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayerViewController" ) as! VideoPlayerViewController
        //            self.present(singleVideoViewController, animated: true, completion: nil)
        playerViewController.video = gallery.sets?[0].media
        playerViewController.sceneTime = gallery.sets?[0].media?[0].scenes?[indexPath.row].at ?? 0
                    self.navigationController?.pushViewController(playerViewController, animated: true)
                    self.dismiss(animated: false, completion: nil)
    }
}
extension SingleVideoViewController: UITableViewDataSource {
    
    func tableView(_ sideTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if gallery.sets != nil {
            return gallery.sets?[0].media?[0].scenes?.count ?? 0}
        else {
            return 0
        }
    }
    func tableView(_ sideTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sideTableView.dequeueReusableCell(withIdentifier: "sideViewCell", for: indexPath)
        if gallery.sets != nil {
            let cellButtonTitle = gallery.sets?[0].media?[0].scenes?[indexPath.row].title
            
            cell.textLabel?.text = cellButtonTitle ?? ""
            
        }
        else {
            cell.textLabel?.text = ""
        }
        cell.textLabel?.textAlignment = .center
        
        
        return cell
    }
}
