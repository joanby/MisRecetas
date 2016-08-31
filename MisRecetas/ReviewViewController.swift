//
//  ReviewViewController.swift
//  MisRecetas
//
//  Created by Juan Gabriel Gomila Salas on 11/7/16.
//  Copyright © 2016 Juan Gabriel Gomila Salas. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var ratingStackView: UIStackView!
    
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    var ratingSelected : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translation = CGAffineTransform(translationX: 0.0, y: 500.0)
        
        //ratingStackView.transform = scale.concat(translation) // Combinar escalado con translación
        
        self.firstButton.transform = scale.concat(translation)
        self.secondButton.transform = scale.concat(translation)
        self.thirdButton.transform = scale.concat(translation)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
                self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        */
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                self.firstButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: { (success) in
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                    self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    }, completion: { (success) in
                        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                            self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                            }, completion: nil)
                })
        })
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    @IBAction func ratingPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected = "good"
        case 3:
            ratingSelected = "great"
        default:
            break
        }
        
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
        
    }
    
    
    
    
    
}
