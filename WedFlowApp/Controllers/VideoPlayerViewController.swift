//
//  VideoPlayerViewController.swift
//  WedFlowApp
//
//  Created by Momcilo Stankovic on 02/07/2020.
//  Copyright © 2020 RedCellApps. All rights reserved.
//

import UIKit
import AVKit

class VideoPlayerViewController: UIViewController {
    var asset: AVAsset!
    var video: [Media]! {
        didSet {
    
            let videoURL = URL (string: video[0].url ?? "")
            asset = AVAsset (url: videoURL!)
            }
    }
    var sceneTime: Int!
   
    var embeddedPlayerViewController: AVPlayerViewController!

    let playerViewControllerSegueIdentifier = "PlayerViewControllerSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard segue.identifier == playerViewControllerSegueIdentifier else { return }
        embeddedPlayerViewController = segue.destination as? AVPlayerViewController
      
      let playerItem = AVPlayerItem(asset: asset)
      let player = AVPlayer(playerItem: playerItem)
        
      print ("MOMOMOMOMOMOMOMO SEEK TIME \(sceneTime ?? 0)")
      
        embeddedPlayerViewController.player = player
      
        if sceneTime != 0 {
//                let st = Double(sceneTime)
                    player.seek(to: CMTime(value: CMTimeValue(sceneTime), timescale: 1), toleranceBefore: CMTime.positiveInfinity, toleranceAfter: CMTime.zero)
        }
        if player.status == .readyToPlay && player.currentItem?.status == .readyToPlay {
                    player.play()
            }
        player.play()
    }
    
}
      
    extension VideoPlayerViewController {
      
      class func instanceWith(video: Media) -> VideoPlayerViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let identifier = "VideoPlayerViewController"
        
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as!
        VideoPlayerViewController
        viewController.title = "MOMOMOMOMOMOMOMOMOMOM"
        viewController.video = [video]
        return viewController
      }
    }
