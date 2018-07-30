//
//  TrailerViewController.swift
//  TrailerFix
//
//  Created by Caio Cardozo on 19/07/18.
//  Copyright © 2018 Caio Cardozo. All rights reserved.
//

import UIKit
import AVKit

class TrailerViewController: UIViewController {

    @IBOutlet weak var ivTrailer: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var viTrailer: UIView!
    
    var trailer: Trailer!
    var player: AVPlayer!
    var playerViewController: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      prepareView()
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: [])
      preparePlayer()
      
    }
    
    func prepareView() {
        lbTitle.text = trailer.title
        lbYear.text = "\(trailer.year)"
        var rating = "Ainda não avaliado"
        if trailer.rating > 0 {
            rating = ""
            for _ in 1...trailer.rating{
                rating += "⭐️"
            }
        }
        lbRating.text = rating
        ivTrailer.image = UIImage(named: trailer.poster + "-large")
        
    }
    
    func preparePlayer() {
        let url = URL(string: trailer.url)
        player = AVPlayer(url: url!)
        playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.showsPlaybackControls = true
        playerViewController.player?.play()
        playerViewController.view.frame = viTrailer.bounds
        viTrailer.addSubview(playerViewController.view)
    }
    

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
