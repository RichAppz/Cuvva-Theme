//
//  CuvvaViewController.swift
//  swift-theme-demo
//
//  Created by Rich Mucha on 09/04/2019.
//  Copyright © 2019 Cuvva. All rights reserved.
//

import Foundation
import UIKit

protocol CuvvaUIComponentProtocol {
    
    var theme: CuvvaTheme? { get set }
    
    func loadTheme(_ theme: CuvvaTheme)
    func handleThemeChangedNotification(notification: Notification)
    
}

class CuvvaViewController: UIViewController {
    
    //================================================================================
    // MARK: - Initialization
    //================================================================================
    
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        setObservers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //================================================================================
    // MARK: - Lifecycle
    //================================================================================
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme(toView: view)
    }
    
    //================================================================================
    // MARK: - Helpers
    //================================================================================
    
    func setObservers() {
        NotificationCenter.default.addObserver(
            forName: kThemeDidChangedNotification,
            object: nil,
            queue: nil) { [weak self] notification in
                guard
                    let this = self,
                    let theme = notification.object as? CuvvaTheme else { return }
                self?.applyTheme(theme, toView: this.view)
        }
    }
    
    func applyTheme(_ theme: CuvvaTheme? = CuvvaThemeManager.shared.currentTheme, toView: UIView) {
        guard let theme = theme else { return }
        if let vw = toView as? CuvvaUIComponentProtocol {
            vw.loadTheme(theme)
        }
        
        toView.subviews.forEach { (v) in
            (v as? CuvvaUIComponentProtocol)?.loadTheme(theme)
            
            if v.subviews.count > 0 {
                applyTheme(toView: v)
            }
        }
    }
    
}
