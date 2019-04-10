//
//  ViewController.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 09/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import UIKit

class ViewController: CuvvaViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionLight(_ sender: Any) {
        CuvvaThemeManager.initialize(themeName: "default_theme")
    }
    
    @IBAction func actionDark(_ sender: Any) {
        CuvvaThemeManager.initialize(themeName: "dark_theme")
    }
    
    @IBAction func actionRandom(_ sender: Any) {
        CuvvaThemeManager.randomise()
    }
}

