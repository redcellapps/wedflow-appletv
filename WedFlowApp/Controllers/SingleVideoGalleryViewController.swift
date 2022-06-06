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
import AVFoundation
import AVKit

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
    @IBOutlet weak var dummyButton: UIButton!
    
    @IBOutlet weak var sideTableView: UITableView!
    @IBOutlet weak var multiVideoCollectionView: UICollectionView!
    
    
    let token = UserDefaults.standard.value(forKey: "token") as? String
    let playerViewController = AVPlayerViewController()
    
    let reuseIdentifier = "MultiVideoCell"
    var gallery: Gallery!
    var videos: [Media]!
    var galleryID: String!
    var selectedCell = 0
    var set: Set!
    var focusTo = UIView()
    var playerItemUrl : URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        focusTo = backButton
        let menuPressRecognizer = UITapGestureRecognizer()
        menuPressRecognizer.addTarget(self, action: #selector(self.menuButtonAction))
        menuPressRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]
        self.view.addGestureRecognizer((menuPressRecognizer))
        
        sideTableView.delegate = self
        sideTableView.dataSource = self
        multiVideoCollectionView.dataSource = self
        multiVideoCollectionView.delegate = self
        self.prepareView()
        self.multiVideoCollectionView.reloadData()
//        getGallery { (galleries) in self.gallery = galleries
//            self.removeSpinner()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.multiVideoCollectionView.reloadData()
        addFocus()
        
    }
    override func loadView() {
        super.loadView()
        //self.showSpinner()
        }
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [focusTo]
    }
    
    @IBAction func galleriesButtonTap(_ sender: Any) {
        let galleryViewController = self.storyboard?.instantiateViewController(withIdentifier: "GalleryList") as! GalleryListController
        self.navigationController?.pushViewController(galleryViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func backButtonTap(_ sender: Any) {
        let albumViewController = self.storyboard?.instantiateViewController(withIdentifier: "AlbumViewController") as! AlbumViewController
        albumViewController.gallery = gallery
        albumViewController.selectedCell = selectedCell
        self.navigationController?.pushViewController(albumViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func menuButtonAction() {
        if sideView.isHidden == false {
            sideView.isHidden = true
        }
        else {
            backButtonTap(self)
        }
        return
    }
        

    
    func prepareView() {
        sideView.isHidden = true
        self.backgroundImage.sd_setImage(with: URL(string: (self.set.coverPhoto?.thumbs?.lg) ?? ""), completed: nil)
        self.addOverlay(toView: backgroundImage, color: .black, opacity: 0.7)
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
        let celBackg = self.set.media?[indexPath.item].coverPhoto?.thumbs?.md ?? ""
        if celBackg != "" {
        cell.cellBackground.sd_setImage(with: URL(string: (self.set.media?[indexPath.item].coverPhoto?.thumbs?.md) ?? ""), completed: nil)
        }
        else {
//            cell.cellBackground.contentMode = .scaleAspectFit
//            cell.cellBackground.backgroundColor = UIColor.black
        }
        cell.cellTitle.text = self.set.media?[indexPath.item].title!
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        selectedCell = indexPath.item

        if set.media?[selectedCell].scenes?.count ?? 0 != 0 {
            self.sideTableView.reloadData()
            sideView.isHidden = false
            focusTo = sideView
            setNeedsFocusUpdate()
        }
        else {
            print ("### \(gallery.sets?[0].media?[0].versions?[0].url)")
            print ("###### \(set?.media?[0].url)")
            
                                      
//            if gallery.sets?[0].media?[0].versions?[0].url != "" || gallery.sets?[0].media?[0].versions?[0].url != nil {
            if set?.media?[indexPath.item].url != "" || set?.media?[indexPath.item].url != nil {
                self.playerItemUrl = URL (string: (set?.media?[indexPath.item].url) ?? "")
//                self.playerItemUrl = URL (string: (gallery.sets?[0].media?[0].versions?[0].url) ?? "")
            } else {
                self.playerItemUrl = URL (string: (gallery.sets?[0].media?[0].versions?[0].url) ?? "")
//                self.playerItemUrl = URL (string: (set?.media?[0].url) ?? "")
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
//            let video = set?.media
//            playerViewController.video = video
//            playerViewController.sceneTime = 0
//            self.navigationController?.pushViewController(playerViewController, animated: true)
//            self.dismiss(animated: false, completion: nil)
        }
            
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
            self.playerViewController.dismiss(animated: true)
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
                self.showError(errorTitle: "ERROR DOWNLOADING MEDIA", errorDesc: error.localizedDescription)
            }
        }
        
    }
    func addFocus() {
        addFocusGuide(from: dummyButton, to: galleriesButton, direction: .top)
        addFocusGuide(from: galleriesButton, to: dummyButton, direction: .bottom)
    }
    
}

extension SingleVideoGalleryViewController: UITableViewDelegate {
    func tableView(_ sideTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let count = (gallery.sets?[0].media?[0].versions!.count)! as Int

        if gallery.sets?[0].media?[0].versions?[0].url != "" || gallery.sets?[0].media?[0].versions?[0].url != nil {
        }else {
            self.playerItemUrl = URL (string: (gallery.sets?[0].media?[0].url) ?? "")
        }
        let player = AVPlayer(url: playerItemUrl!)
        playerViewController.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerViewController.player?.currentItem)
        self.present(playerViewController, animated: true) {
            let sceneTime = self.gallery.sets?[0].media?[0].scenes?[indexPath.row].at ?? 0
            if  sceneTime != 0 {
                player.seek(to: CMTime(value: CMTimeValue(sceneTime), timescale: 1), toleranceBefore: CMTime.positiveInfinity, toleranceAfter: CMTime.zero)
                }
                if player.status == .readyToPlay && player.currentItem?.status == .readyToPlay {
                    player.play()
                    }
            player.play()
            }
        
//        let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayerViewController" ) as! VideoPlayerViewController
//        //            self.present(singleVideoViewController, animated: true, completion: nil)
//        playerViewController.video = gallery.sets?[0].media
//        playerViewController.sceneTime = set.media?[selectedCell].scenes?[indexPath.row].at ?? 0
//                    self.navigationController?.pushViewController(playerViewController, animated: true)
//                    self.dismiss(animated: false, completion: nil)
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
            let cellButtonTitle =
            set.media?[selectedCell].scenes?[indexPath.row].title
            cell.textLabel?.font = UIFont (name: "Montserrat", size: 25)
            cell.textLabel?.text = cellButtonTitle ?? ""
            
        }
        else {
            cell.textLabel?.text = ""
        }
        cell.textLabel?.font = UIFont (name: "Montserrat", size: 25)
        cell.textLabel?.textAlignment = .left
        cell.layer.backgroundColor = UIColor(hexString:"404040").cgColor
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        return cell
    }
}

