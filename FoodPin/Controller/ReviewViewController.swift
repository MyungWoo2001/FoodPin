//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Myung Woo on 8/13/24.
//

import UIKit

class ReviewViewController: UIViewController {
    var i = 0.1

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(data: restaurant.image)
        
        // Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let moveUpTransform = CGAffineTransform.init(translationX: 0, y: -600)
        
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        
        // Make the button invisible
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
        
        closeButton.transform = moveUpTransform
        closeButton.alpha = 0
        
        
        
    }
        
    @IBOutlet var backgroundImageView: UIImageView!
    
    var restaurant = Restaurant()
    
    @IBOutlet var closeButton: UIButton!
    
    @IBOutlet var rateButtons: [UIButton]!
    
//    override func viewWillAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 2.0) {
//            self.rateButtons[0].alpha = 1.0
//            self.rateButtons[1].alpha = 1.0
//            self.rateButtons[2].alpha = 1.0
//            self.rateButtons[3].alpha = 1.0
//            self.rateButtons[4].alpha = 1.0
//        }
//    }
    
     // MARK: Animation
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.4, delay:0.1, options: [], animations: {
            self.closeButton.alpha = 1
            self.closeButton.transform = .identity
        }, completion: nil)
        
//        // Spring animation
//        UIView.animate(withDuration: 0.4, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3 , options: [], animations: {
//            self.rateButtons[0].alpha = 1.0
//            self.rateButtons[0].transform = .identity
//        }, completion: nil)
//        
//        UIView.animate(withDuration: 0.4, delay: 0.15, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3 , options: [], animations: {
//            self.rateButtons[1].alpha = 1.0
//            self.rateButtons[1].transform = .identity
//        }, completion: nil)
//        UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3 , options: [], animations: {
//            self.rateButtons[2].alpha = 1.0
//            self.rateButtons[2].transform = .identity
//        }, completion: nil)
//        UIView.animate(withDuration: 0.4, delay: 0.25, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3 , options: [], animations: {
//            self.rateButtons[3].alpha = 1.0
//            self.rateButtons[3].transform = .identity
//        }, completion: nil)
//        UIView.animate(withDuration: 0.4, delay: 0.3, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3 , options: [], animations: {
//            self.rateButtons[4].alpha = 1.0
//            self.rateButtons[4].transform = .identity
//        }, completion: nil)
        
//        for k in 0...4 {
//            UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
//                self.rateButtons[k].alpha = 1.0
//                self.rateButtons[k].transform = .identity
//            }, completion: nil)
//        }
        
        for rateButton in rateButtons{
            UIView.animate(withDuration: 0.4, delay: i, options: [], animations: {
                rateButton.alpha = 1.0
                rateButton.transform = .identity
            }, completion: nil)
            
            i += 0.05
        }
        
//        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
//            self.rateButtons[0].alpha = 1.0
//            self.rateButtons[0].transform = .identity
//        }, completion: nil)
//        
//        UIView.animate(withDuration: 0.4, delay: 0.15, options: [], animations: {
//            self.rateButtons[1].alpha = 1.0
//            self.rateButtons[1].transform = .identity
//        }, completion: nil )
//        
//        UIView.animate(withDuration: 0.4, delay: 0.2, options: [], animations: {
//            self.rateButtons[2].alpha = 1.0
//            self.rateButtons[2].transform = .identity
//        }, completion: nil)
//        
//        UIView.animate(withDuration: 0.4, delay: 0.25, options: [], animations: {
//            self.rateButtons[3].alpha = 1.0
//            self.rateButtons[3].transform = .identity
//        }, completion: nil)
//        
//        UIView.animate(withDuration: 0.4, delay: 0.3, options: [], animations: {
//            self.rateButtons[4].alpha = 1.0
//            self.rateButtons[4].transform = .identity
//        }, completion: nil)
    }

}
