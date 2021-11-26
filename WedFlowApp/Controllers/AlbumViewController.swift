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
import AVFoundation
import AVKit
import FocusTvButton


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
    @IBOutlet weak var dummyPlayButton: UIButton!
    @IBOutlet weak var dummySceneButton: UIButton!
    @IBOutlet weak var playFromBeginningButton: FocusTvButton!
    
    let reuseIdentifier = "AlbumCollectionViewCell"
    let token = UserDefaults.standard.value(forKey: "token") as? String
    var gallery: Gallery!
    var mediaURLs: [URL]! = []
    var mediaItems: [AVPlayerItem]! = []
    var allMedia: [Media]!
    var selectedCell: Int!
    var highlightedCell: Int!
    let playerViewController = AVPlayerViewController()
    var focusTo = UIView()
    var mURL : URL!
    var playerItemUrl : URL!
    var playerItem = ""
    var indexPath = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getGallery { (galleries) in self.gallery = galleries
            self.prepareView()
            self.prepareMedia()
            self.albumCollectionView.reloadData()
            //            self.getAllMedia {(allMedia) in self.allMedia = allMedia
            //                self.albumCollectionView.reloadData()
            //
            //            }
            
        }
        indexPath = 0
        focusTo = playFilmButton
        let menuPressRecognizer = UITapGestureRecognizer()
        menuPressRecognizer.addTarget(self, action: #selector(self.menuButtonAction))
        menuPressRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]
        self.view.addGestureRecognizer((menuPressRecognizer))
        sideTableView.delegate = self
        sideTableView.dataSource = self
        self.sceneButton.isHidden = true
        self.sideView.isHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addFocus()
    }
    override func loadView() {
        super.loadView()
        self.showSpinner()
        }
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [focusTo]
    }

    @IBAction func galleriesButtonTap(_ sender: Any) {
        let galleryViewController = self.storyboard?.instantiateViewController(withIdentifier: "GalleryList") as! GalleryListController
        self.navigationController?.pushViewController(galleryViewController, animated: true)
        
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func menuButtonAction() {
        if sideView.isHidden == false {
            sideView.isHidden = true
        }
        else {
            galleriesButtonTap(self)
        }
        return
    }
    
    @IBAction func sceneButtonTap(_ sender: Any) {
        if sideView.isHidden == true {
            focusTo = playFromBeginningButton
            setNeedsFocusUpdate()
            sideView.isHidden = false
            
        }
        else {
            sideView.isHidden = true
        }
    }
    
    @IBAction func playFromBeginning(_ sender: Any) {
        let player = AVPlayer(url: self.playerItemUrl)
        print ("PLAYER ITEM FROM BEGINNING = \(self.playerItemUrl)")
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
                    self.playerViewController.player!.play()
                }
        
    }
    @IBAction func playButton(_ sender: Any) {

        let player = AVQueuePlayer (items: mediaItems)
        playerViewController.player = player
//        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerViewController.player?.currentItem)
        self.present(playerViewController, animated: true) {
                    self.playerViewController.player!.play()
                }
        
//        let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "QueuePlayerViewController") as! QueuePlayerViewController
//        self.present(singleVideoViewController, animated: true, completion: nil)
        
//        playerViewController.sets = gallery.sets
//        playerViewController.allMedia = mediaURLs
//
//        self.navigationController?.pushViewController(playerViewController, animated: true)
//        self.dismiss(animated: false, completion: nil)
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
            self.playerViewController.dismiss(animated: true)
        }
    
    func addFocus() {
        addFocusGuide(from: playFilmButton, to: galleriesButton, direction: .top)
        addFocusGuide(from: galleriesButton, to: playFilmButton, direction: .bottom)
        addFocusGuide(from: sideView, to: galleriesButton, direction: .top)
        addFocusGuide(from: dummySceneButton, to: galleriesButton, direction: .top)
        addFocusGuide(from: dummyPlayButton, to: galleriesButton, direction: .top)
    }
    // Gallery table view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gallery.sets?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! AlbumCollectionViewCell
        
        cell.cellBackground.sd_setImage(with: URL(string:
            (self.gallery!.sets![indexPath.item].coverPhoto?.thumbs?.md) ?? ""), completed: nil)
        
        cell.cellTitle.text = self.gallery.sets?[indexPath.item].title ?? ""
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        selectedCell = indexPath.item
        if (gallery.sets?[selectedCell].media!.count)! > 1 {
            sideView.isHidden = true
            let videos = gallery.sets?[selectedCell].media
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
            if gallery.sets?[selectedCell].media?[0].versions?[0].url != "" || gallery.sets?[selectedCell].media?[0].versions?[0].url != nil {
                self.playerItemUrl = URL (string: (gallery.sets?[selectedCell].media?[0].versions?[0].url) ?? "")
            }else {
                self.playerItemUrl = URL (string: (gallery.sets?[selectedCell].media?[0].url) ?? "")
            }
            //sceneButton.isHidden = true
            //sceneButton.setTitle("CHAPTERS", for: .normal)
            focusTo = self.playFromBeginningButton
            setNeedsFocusUpdate()
            sideView.isHidden = false
        }
            
        else if gallery.sets?[selectedCell].media?.count == 1 {
            if gallery.sets?[selectedCell].media?[0].versions?[0].url != "" || gallery.sets?[selectedCell].media?[0].versions?[0].url != nil {
                self.playerItemUrl = URL (string: (gallery.sets?[selectedCell].media?[0].versions?[0].url) ?? "")
            }else {
                self.playerItemUrl = URL (string: (gallery.sets?[selectedCell].media?[0].url) ?? "")
            }
            let player = AVPlayer(url: self.playerItemUrl!)
            playerViewController.player = player
            NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerViewController.player?.currentItem)
            self.present(playerViewController, animated: true) {
                        self.playerViewController.player!.play()
                    }
            
//            let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayerViewController") as!
//            VideoPlayerViewController
//            //            self.present(singleVideoViewController, animated: true, completion: nil)
//            playerViewController.video = gallery.sets?[indexPath.item].media
//            playerViewController.sceneTime = 0
//            self.navigationController?.pushViewController(playerViewController, animated: true)
//            //self.dismiss(animated: false, completion: nil)
        }
        
    }
    
        func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
            highlightedCell = indexPath.item
        }
    
    func prepareMedia() {
        for set in gallery.sets! {
            
            for media in set.media! {
                if media.versions?[0].url != "" || media.versions?[0].url != nil {

                    self.mURL = URL(string: (media.versions?[0].url!)!)
                }else {
                    self.mURL = URL(string: media.url!)
                }

                let mItem = AVPlayerItem(url: self.mURL!)
                mediaItems.append(mItem)
                mediaURLs.append(self.mURL!)
            }
        }
    }
    
    func prepareView() {
        
        self.backgroundImage.sd_setImage(with: URL(string: (self.gallery.coverPhoto?.thumbs?.lg) ?? ""), completed: nil)
        addOverlay(toView: backgroundImage, color: .black, opacity: 0.7)
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
    }
    
    func getGallery(completion: @escaping (Gallery) -> ()) {
        let header : HTTPHeaders = ["x-access-token": token!]
        let galleryURL = "https://wedflow.co/api/galleries/\(gallery.id!)?expand=sets"
        AF.request(galleryURL, method: .get, headers: header).response{
            responseData in
            
            guard let data = responseData.data else {return}
            do {
                let galleries = try JSONDecoder().decode(Gallery.self, from: data)
                DispatchQueue.main.async {
                    completion (galleries)
                    self.removeSpinner()
                }
            }
            catch {
                print ("ERROR DECODING")
            }
        }
        
    }
    
    func getAllMedia(completion: @escaping ([Media]) -> ()) {
        let header : HTTPHeaders = ["x-access-token": token!]
        let allVideosURL = "https://wedflow.co/api/galleries/\(gallery.id!)/videos"

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
//        let count = (gallery.sets?[0].media?[0].versions!.count)! as Int
//        if gallery.sets?[0].media?[0].versions?[0].url! != "" || gallery.sets?[0].media?[0].versions?[0].url! != nil {
//            self.playerItemUrl = URL (string: (gallery.sets?[0].media?[0].versions?[0].url!) ?? "")
//        }else if gallery.sets?[0].media?[0].versions?[1].url! != "" || gallery.sets?[0].media?[0].versions?[1].url! != nil {
//            self.playerItemUrl = URL (string: (gallery.sets?[0].media?[0].versions?[1].url!) ?? "")
//        }else {
//            self.playerItemUrl = URL (string: (gallery.sets?[0].media?[0].url) ?? "")
//        }
        let player = AVPlayer(url: self.playerItemUrl!)
        playerViewController.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerViewController.player?.currentItem)
        self.present(playerViewController, animated: true) {
            
//            let sceneTime = self.gallery.sets?[0].media?[0].scenes?[indexPath.row].at ?? 0
            let sceneTime = self.gallery.sets?[self.selectedCell].media?[0].scenes?[indexPath.row].at ?? 0
            
            if  sceneTime != 0 {
//                  print ("MOMO PLAYER ITEM = \(self.playerItemUrl)")
//                  print ("MOMO SCENE TIME = \(sceneTime)")
                player.pause()
                player.seek(to: CMTimeMakeWithSeconds(Float64(sceneTime), preferredTimescale: 1), completionHandler: { (true) -> Void in
                    player.play()
                } )
                }
//            if  sceneTime != 0 {
//                print ("MOMO SCENE TIME = \(sceneTime)")
//                player.seek(to: CMTime(value: CMTimeValue(sceneTime), timescale: 1), toleranceBefore: CMTime.positiveInfinity, toleranceAfter: CMTime.zero)
//                }
//                if player.status == .readyToPlay && player.currentItem?.status == .readyToPlay {
//                    player.seek(to: CMTime(value: CMTimeValue(sceneTime), timescale: 1))
//                    if player.status == .readyToPlay && player.currentItem?.status == .readyToPlay {
//                        player.play()
//                        }
//                    }
//            }
            
            
//        let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayerViewController" ) as! VideoPlayerViewController
//        //            self.present(singleVideoViewController, animated: true, completion: nil)
//        playerViewController.video = gallery.sets?[selectedCell].media
//        playerViewController.sceneTime = gallery.sets?[selectedCell].media?[0].scenes?[indexPath.row].at ?? 0
//        self.navigationController?.pushViewController(playerViewController, animated: true)
//        self.dismiss(animated: false, completion: nil)
    }
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
        cell.textLabel?.font = UIFont (name: "Montserrat", size: 25)
        cell.textLabel?.textAlignment = .left
        cell.textLabel?.text = cellButtonTitle ?? ""
        cell.layer.backgroundColor = UIColor(hexString:"404040").cgColor
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        return cell
    }
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return true
    }
//    func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
//        return IndexPath(index: 0)
//    }
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


