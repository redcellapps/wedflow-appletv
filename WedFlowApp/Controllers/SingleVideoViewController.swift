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
import AVFoundation
import AVKit

class SingleVideoViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var studioLogo: UIImageView!
    @IBOutlet weak var studioName: UILabel!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoSubtitle: UILabel!
    @IBOutlet weak var playFilmButton: UIButton!
    @IBOutlet weak var sceneButton: UIButton!
    @IBOutlet weak var galleriesButton: UIButton!
    
    @IBOutlet weak var dummySceneButton: UIButton!
    @IBOutlet weak var dummyButton: UIButton!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var sideImage: UIImageView!
    @IBOutlet weak var sideTitle: UILabel!
    @IBOutlet weak var sideTableView: UITableView!
    
    @IBOutlet weak var sideMenuButton: UIButton!
    
    let token = UserDefaults.standard.value(forKey: "token") as? String
    var gallery: Gallery!
    let playerViewController = AVPlayerViewController()
    var focusTo = UIView()
    var playerItemUrl : URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        focusTo = playFilmButton
        let menuPressRecognizer = UITapGestureRecognizer()
        menuPressRecognizer.addTarget(self, action: #selector(self.menuButtonAction))
        menuPressRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.menu.rawValue)]
        self.view.addGestureRecognizer((menuPressRecognizer))
        
        sideTableView.delegate = self
        sideTableView.dataSource = self
        
        getGallery { (galleryFull) in self.gallery = galleryFull
            self.prepareView()
        }
    }
    override func loadView() {
        super.loadView()
        self.showSpinner()
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        addFocus()
    }
    
    
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [focusTo]
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
            focusTo = sideView
            setNeedsFocusUpdate()
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
            let count = (gallery.sets?[0].media?[0].versions!.count)! as Int
        if gallery.sets?[0].media?[0].versions?[0].url != "" || gallery.sets?[0].media?[0].versions?[0].url != nil {
            self.playerItemUrl = URL (string: (gallery.sets?[0].media?[0].versions?[0].url) ?? "")
        }else {
            self.playerItemUrl = URL (string: (gallery.sets?[0].media?[0].url) ?? "")
        }
        let player = AVPlayer(url: self.playerItemUrl!)
        playerViewController.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerViewController.player?.currentItem)
        self.present(playerViewController, animated: true) {
                    self.playerViewController.player!.play()
                }
        
        
//        let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayerViewController") as!
//            VideoPlayerViewController
//        //            self.present(singleVideoViewController, animated: true, completion: nil)
//        playerViewController.video = gallery.sets?[0].media
//        playerViewController.sceneTime = 0
//        self.navigationController?.pushViewController(playerViewController, animated: true)
//        self.dismiss(animated: false, completion: nil)
    }
    
//    func forceFocus(to: UIView) {
//        myPreferredFocusedView = to
//        setNeedsFocusUpdate()
//        updateFocusIfNeeded()
//    }
    
    func prepareView() {
        sideView.isHidden = true
        sceneButton.isHidden = true
        playFilmButton.isHidden = true
        let celBackg = self.gallery.coverPhoto?.thumbs?.lg ?? ""
        if celBackg != "" {
            self.backgroundImage.sd_setImage(with: URL(string: (self.gallery.coverPhoto?.thumbs?.lg) ?? ""), completed: nil)
        }
        else {
//            self.backgroundImage.contentMode = .scaleAspectFit
//            self.backgroundImage.backgroundColor = UIColor.black
        }
        
        self.addOverlay(toView: backgroundImage, color: .black, opacity: 0.7)
        setStudioLogo()

        studioName.text = gallery.studio?.name
        videoTitle.text = gallery.title
        videoSubtitle.text = gallery.subtitle
        
//        playFilmButton.backgroundColor = UIColor(hexString: (gallery.style?.secondaryColor)!)
//        sceneButton.backgroundColor = UIColor(hexString: (gallery.style?.secondaryColor)!)
//        galleriesButton.backgroundColor = UIColor(hexString: (gallery.style?.secondaryColor)!)
        
        sideImage.sd_setImage(with: URL(string: (self.gallery.coverPhoto?.thumbs?.md) ?? ""), completed: nil)
        
        sideTitle.text = gallery.title
        
        if ((gallery.sets?[0].media?.count) ?? 0) > 0 {
            playFilmButton.isHidden = false
            if ((gallery.sets?[0].media?[0].scenes?.count) ?? 0) > 0 {
                sideTableView.reloadData()
                //            sceneButton.setTitle("Select Scene", for: .normal)
                sceneButton.isHidden = false
            }
        }
    }
    func setStudioLogo() {
        studioLogo.sd_setImage(with: URL(string: (self.gallery.studio?.logo?.url) ?? ""))
        studioLogo.layer.masksToBounds = true
        studioLogo.layer.cornerRadius = studioLogo.bounds.width / 2
        studioLogo.layer.borderWidth = 2
        studioLogo.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func addFocus() {
        addFocusGuide(from: playFilmButton, to: galleriesButton, direction: .top)
        addFocusGuide(from: galleriesButton, to: playFilmButton, direction: .bottom)
        addFocusGuide(from: sideView, to: galleriesButton, direction: .top)
        addFocusGuide(from: dummyButton, to: galleriesButton, direction: .top)
        addFocusGuide(from: dummySceneButton, to: galleriesButton, direction: .top)
    }
    
    func getGallery(completion: @escaping (Gallery) -> ()) {
        let header : HTTPHeaders = ["x-access-token": token!]
        let galleryURL = "https://wedflow.co/api/galleries/\(gallery.id!)?expand=sets"
        AF.request(galleryURL, method: .get, headers: header).response{
            responseData in
            
            guard let data = responseData.data else {return}
            do {
                let galleryFull = try JSONDecoder().decode(Gallery.self, from: data)
                DispatchQueue.main.async {
                    completion (galleryFull)
                    self.removeSpinner()
                }
            }
            catch {
                print ("ERROR DECODING")
            }
        }
        
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
            self.playerViewController.dismiss(animated: true)
        }

}

extension SingleVideoViewController: UITableViewDelegate {
    func tableView(_ sideTableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if gallery.sets?[0].media?[0].versions?[0].url != "" || gallery.sets?[0].media?[0].versions?[0].url != nil {
        self.playerItemUrl = URL (string: (gallery.sets?[0].media?[0].versions?[0].url) ?? "")
        }
        else{
            self.playerItemUrl = URL (string: (gallery.sets?[0].media?[0].url) ?? "")
        }
        let player = AVPlayer(url: self.playerItemUrl!)
        playerViewController.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerViewController.player?.currentItem)
        self.present(playerViewController, animated: true) {
            let sceneTime = self.gallery.sets?[0].media?[0].scenes?[indexPath.row].at ?? 0
            if  sceneTime != 0 {
                player.seek(to: CMTime(value: CMTimeValue(sceneTime), timescale: 1), completionHandler: { (true) in
                    player.play()
                } )
                }
//                if player.status == .readyToPlay && player.currentItem?.status == .readyToPlay {
//                    player.play()
//                    }
//            player.play()
            }
        
//        let playerViewController = self.storyboard?.instantiateViewController(withIdentifier: "VideoPlayerViewController" ) as! VideoPlayerViewController
//        //            self.present(singleVideoViewController, animated: true, completion: nil)
//        playerViewController.video = gallery.sets?[0].media
//        playerViewController.sceneTime = gallery.sets?[0].media?[0].scenes?[indexPath.row].at ?? 0
//        self.navigationController?.pushViewController(playerViewController, animated: true)
//        self.dismiss(animated: false, completion: nil)
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
//    func indexPathForPreferredFocusedView(in sideTableView: UITableView) -> IndexPath? {
//        return IndexPath(index: 0)
//    }

}
