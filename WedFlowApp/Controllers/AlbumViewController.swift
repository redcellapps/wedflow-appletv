//
//  AlbumViewController.swift
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


class AlbumViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
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
    @IBOutlet weak var albumCollectionView: UICollectionView!
    
    
    let reuseIdentifier = "AlbumCollectionViewCell"
    let token = UserDefaults.standard.value(forKey: "token") as? String
    var gallery: Gallery!
    var mediaURLs: [URL]! = []
    var allMedia: [Media]!
    var selectedCell: Int!
    var highlightedCell: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideTableView.delegate = self
        sideTableView.dataSource = self
        self.sceneButton.isHidden = true
        getGallery { (galleries) in self.gallery = galleries
            self.prepareView()
            self.prepareMedia()
            self.albumCollectionView.reloadData()
            //            self.getAllMedia {(allMedia) in self.allMedia = allMedia
            //                self.albumCollectionView.reloadData()
            //
            //            }
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addFocus()
        
    }
    @IBAction func galleriesButtonTap(_ sender: Any) {
        let galleryViewController = self.storyboard?.instantiateViewController(withIdentifier: "GalleryList") as! GalleryListController
        self.navigationController?.pushViewController(galleryViewController, animated: true)
        
        self.dismiss(animated: false, completion: nil)
        print ("MOMO GALERIES PRESS")
    }
    
    @IBAction func sceneButtonTap(_ sender: Any) {
        if sideView.isHidden == true {
            sideView.isHidden = false
        }
        else {
            sideView.isHidden = true
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "QueuePlayerViewController") as! QueuePlayerViewController
        //            self.present(singleVideoViewController, animated: true, completion: nil)
        
        playerViewController.sets = gallery.sets
        playerViewController.allMedia = mediaURLs
        self.navigationController?.pushViewController(playerViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
        
    }
    
    func addFocus() {
        addFocusGuide(from: playFilmButton, to: galleriesButton, direction: .top)
        addFocusGuide(from: galleriesButton, to: playFilmButton, direction: .bottom)
        addFocusGuide(from: sideView, to: galleriesButton, direction: .top)
    }
    // Gallery table view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print ("MOMO BROJ CELIJA \(self.gallery.sets?.count ?? 0)")
        return self.gallery.sets?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! AlbumCollectionViewCell
        
        cell.cellBackground.sd_setImage(with: URL(string:
            (self.gallery!.sets![indexPath.item].coverPhoto?.thumbs?.md) ?? ""), completed: nil)
        cell.cellTitle.text = self.gallery.sets![indexPath.item].title!
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        selectedCell = indexPath.item
        if (gallery.sets?[selectedCell].media!.count)! > 1 {
            sideView.isHidden = true
            let videos = gallery.sets?[selectedCell].media
            print ("MOMO IMA MULTI VIDEO")
            let singleVideoGalleryViewController = self.storyboard?.instantiateViewController(withIdentifier: "SingleVideoGallery") as! SingleVideoGalleryViewController
            //            self.present(singleVideoViewController, animated: true, completion: nil)
                        singleVideoGalleryViewController.videos = videos
                        singleVideoGalleryViewController.gallery = gallery
                        singleVideoGalleryViewController.galleryID = gallery.id
                        singleVideoGalleryViewController.set = gallery.sets?[selectedCell]
                        self.navigationController?.pushViewController(singleVideoGalleryViewController, animated: true)
                        self.dismiss(animated: false, completion: nil)

        }
            
            
        else if gallery.sets?[selectedCell].media?.count != 0 && gallery.sets?[selectedCell].media?[0].scenes?.count != 0 {
            self.sideTableView.reloadData()
            sideImage.sd_setImage(with: URL(string: (self.gallery.sets?[selectedCell].coverPhoto?.thumbs?.md) ?? ""), completed: nil)
            sideTitle.text = self.gallery.sets?[selectedCell].title
            //                            sideImage.sd_setImage(with: URL(string: (self.gallery.coverPhoto?.thumbs?.md) ?? ""), completed: nil)
            //                            sideTitle.text = gallery.title
            sceneButton.setTitle("Select Scene", for: .normal)
            sideView.isHidden = false
            print ("MOMO IMA SCENE")
        }
            
        else if gallery.sets?[selectedCell].media!.count == 1 {
            let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayerViewController") as!
            VideoPlayerViewController
            //            self.present(singleVideoViewController, animated: true, completion: nil)
            playerViewController.video = gallery.sets?[indexPath.item].media
            playerViewController.sceneTime = 0
            self.navigationController?.pushViewController(playerViewController, animated: true)
            self.dismiss(animated: false, completion: nil)
        }
        
    }
    
    //    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    //        highlightedCell = indexPath.item
    //        print("You highlighted cell #\(indexPath.item)!")
    //    }
    
    func prepareMedia() {
        for set in gallery.sets! {
            for media in set.media! {
                let mURL = URL(string: media.url!)
                mediaURLs.append(mURL!)
            }
        }
    }
    
    func prepareView() {
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
        debugPrint ("MOMO \(gallery.sets!)")
    }
    
    func getGallery(completion: @escaping (Gallery) -> ()) {
        let header : HTTPHeaders = ["x-access-token": token!]
        let galleryURL = "http://stage-tv.wedflow.co/api/galleries/\(gallery.id!)?expand=sets"
        
        AF.request(galleryURL, method: .get, headers: header).response{
            responseData in
            print ("MOMO GALLERY \(responseData.debugDescription)")
            
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
    
    func getAllMedia(completion: @escaping ([Media]) -> ()) {
        let header : HTTPHeaders = ["x-access-token": token!]
        let allVideosURL = "http://stage-tv.wedflow.co/api/galleries/\(gallery.id!)/videos"
        AF.request(allVideosURL, method: .get, headers: header).response{
            responseData in
            guard let data = responseData.data else {return}
            do {
                let allMedia = try JSONDecoder().decode([Media].self, from: data)
                DispatchQueue.main.async {
                    completion (allMedia)
                }
            }
            catch {
                print ("ERROR DECODING")
            }
        }
        
    }
}
extension AlbumViewController: UITableViewDelegate {
    func tableView(_ sideTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayerViewController" ) as! VideoPlayerViewController
        //            self.present(singleVideoViewController, animated: true, completion: nil)
        playerViewController.video = gallery.sets?[selectedCell].media
        playerViewController.sceneTime = gallery.sets?[selectedCell].media?[0].scenes?[indexPath.row].at ?? 0
        self.navigationController?.pushViewController(playerViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
}
extension AlbumViewController: UITableViewDataSource {
    
    func tableView(_ sideTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //            return gallery.sets?[0].media?[0].scenes?.count ?? 0
        return gallery.sets?[selectedCell].media?[0].scenes?.count ?? 0
    }
    func tableView(_ sideTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sideTableView.dequeueReusableCell(withIdentifier: "sideViewCell", for: indexPath)
        //            var cellButtonTitle = gallery.sets?[selectedCell].media?[0].scenes?[indexPath.row].title
        let cellButtonTitle = gallery.sets?[selectedCell].media?[0].scenes?[indexPath.row].title
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = cellButtonTitle ?? ""
        return cell
    }
}

extension UIViewController {
    func addFocusGuide(from origin: UIView, to destination: UIView, direction: UIRectEdge) -> UIFocusGuide {
        let focusGuide = UIFocusGuide()
        view.addLayoutGuide(focusGuide)
        focusGuide.preferredFocusEnvironments = [destination]
        
        // Configure size to match origin view
        focusGuide.widthAnchor.constraint(equalTo: origin.widthAnchor).isActive = true
        focusGuide.heightAnchor.constraint(equalTo: origin.heightAnchor).isActive = true
        
        switch direction {
        case .bottom: // swipe down
            focusGuide.topAnchor.constraint(equalTo: origin.bottomAnchor).isActive = true
            focusGuide.leftAnchor.constraint(equalTo: origin.leftAnchor).isActive = true
        case .top: // swipe up
            focusGuide.bottomAnchor.constraint(equalTo: origin.topAnchor).isActive = true
            focusGuide.leftAnchor.constraint(equalTo: origin.leftAnchor).isActive = true
        case .left: // swipe left
            focusGuide.topAnchor.constraint(equalTo: origin.topAnchor).isActive = true
            focusGuide.rightAnchor.constraint(equalTo: origin.leftAnchor).isActive = true
        case .right: // swipe right
            focusGuide.topAnchor.constraint(equalTo: origin.topAnchor).isActive = true
            focusGuide.leftAnchor.constraint(equalTo: origin.rightAnchor).isActive = true
        default:
            // Not supported :(
            break
        }
        
        return focusGuide
    }
}


