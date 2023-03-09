//
//  UIViewController + Utils.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 22/02/23.
//

import UIKit

extension UIViewController {
    
    // MARK: - Set NavigationBar
    func setNavigationBar() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let statusBarHeight = windowScene.statusBarManager?.statusBarFrame.height {
            
            let navigationbar = UINavigationBar(frame: CGRect(x: 0, y: statusBarHeight, width: self.view.bounds.width, height: self.view.bounds.height))
            
            let navItem = UINavigationItem(title: "Add New Beneficiary")
           // navItem.titleView?.tintColor = .white
            
            UINavigationBar.appearance().barTintColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            UINavigationBar.appearance().isTranslucent = false
            navigationbar.setItems([navItem], animated: false)
            view.addSubview(navigationbar)
        }
    }
    
    // MARK: - changeStatusBarColor
    func changeStatusBarColor() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let statusBarHeight = windowScene.statusBarManager?.statusBarFrame.height {
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
            view.addSubview(statusbarView)
            
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                statusbarView.heightAnchor.constraint(equalToConstant: statusBarHeight),
                statusbarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
                statusbarView.topAnchor.constraint(equalTo: view.topAnchor),
                statusbarView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
        else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
        }
    }
}
