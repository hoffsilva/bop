//
//  ChangeLanguageViewController.swift
//  Bop
//
//  Created by Hoff Henry Pereira da Silva on 18/02/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit
import Hero

class ChangeLanguageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func giveUpChangeLanguage() {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "moviesList")
        Hero.shared.defaultAnimation = .zoomSlide(direction: HeroDefaultAnimationType.Direction.right)
        Hero.shared.animate()
        hero_replaceViewController(with: vc)
    }
    
    @IBAction func updateLanguage() {
        
    }

}
