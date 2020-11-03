//
//  QueuePlayerViewController.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

import UIKit
import AVFoundation

class QueuePlayerViewController: UIViewController {
    
    var playerLayer: AVPlayerLayer?
    var queuePlayer: AVQueuePlayer?
    //var allMedia: URL?
    var sets: [Set]?
    var player: AVQueuePlayer? {
        return queuePlayer
    }
    
    var allMedia:[URL]? {
        didSet {
            guard let allMedia = allMedia else {
                return
            }
            setupQueuePlayerWith (videos: allMedia)
        }
    }
    
    var queuePlayerViewController: QueuePlayerViewController!
    let queuePlayerControllerSegue = "QueueViewControllerSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == queuePlayerControllerSegue else {
            return
        }
        let playerViewController = segue.destination as! QueuePlayerViewController
        queuePlayerViewController = playerViewController
        playerViewController.sets = sets
    }
    
    private func setupQueuePlayerWith (videos: [URL]) {
        let playerItems = videos.map {AVPlayerItem (url: $0)}
        queuePlayer = AVQueuePlayer (items: playerItems)
        queuePlayer!.play()
        setupPlayerLayer()
    }
    
    private func setupPlayerLayer() {
        guard let queuePlayer = queuePlayer, isViewLoaded else {
            return
        }
        playerLayer?.removeFromSuperlayer()
        playerLayer = AVPlayerLayer (player: queuePlayer)
        playerLayer!.frame = view.layer.bounds
        view.layer.addSublayer(playerLayer!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupPlayerLayer()
    }
//    var asset: AVAsset!
//    var video: [Media]! {
//        didSet {
//            let videoURL = URL (string: video[0].url ?? "")
//            asset = AVAsset (url: videoURL!)
//        }
//    }
//    var sceneTime: Int!
//
//    var embeddedPlayerViewController: QueuePlayerViewController!
//
//    let queueViewControllerSegueIdentifier = "QueueViewControllerSegue"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//      super.viewWillAppear(animated)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//      guard segue.identifier == queueViewControllerSegueIdentifier else { return }
//        embeddedPlayerViewController = segue.destination as? QueuePlayerViewController
//
//      let playerItem = AVPlayerItem(asset: asset)
//      let player = AVPlayer(playerItem: playerItem)
//
//      print ("MOMOMOMOMOMOMOMO SEEK TIME \(sceneTime ?? 0)")
//
//        embeddedPlayerViewController.player = player
//
//        if sceneTime != 0 {
//            print ("MOMO STATUS \((player.status.rawValue))")
//            print ("MOMO ITEM STATUS \((player.currentItem?.status.rawValue)!)")
//            print ("MOMO CMT TIME \(player.currentTime())")
////                let st = Double(sceneTime)
//                    player.seek(to: CMTime(value: CMTimeValue(sceneTime), timescale: 1), toleranceBefore: CMTime.positiveInfinity, toleranceAfter: CMTime.zero)
//        }
//        if player.status == .readyToPlay && player.currentItem?.status == .readyToPlay {
//                    player.play()
//            }
//        player.play()
//    }
//
//}
//
//    extension VideoPlayerViewController {
//
//      class func instanceWith(video: Media) -> VideoPlayerViewController {
//
//        let storyboard = UIStoryboard(name: "Main", bundle: .main)
//        let identifier = "VideoPlayerViewController"
//
//        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as!
//        VideoPlayerViewController
//        viewController.title = "MOMOMOMOMOMOMOMOMOMOM"
//        viewController.video = [video]
//        return viewController
//      }
//    }
}
