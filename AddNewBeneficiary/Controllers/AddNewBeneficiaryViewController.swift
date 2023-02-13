//
//  ViewController.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 07/02/23.
//
import UIKit

class AddNewBeneficiaryViewController: UIViewController {
    
    
    let addNewBeneficiaryView = AddNewBeneficiaryView()
    var buttonView = ContinueButtonView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStatusBarColor()
        setNavigationBar()
                style()
                layout()
    }

    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [addNewBeneficiaryView])
        view.axis = .vertical
        view.spacing = 0
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var btnStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [buttonView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.backgroundColor = .white
        return view
    }()
    
}
    
extension AddNewBeneficiaryViewController {
        private func style(){
            
            addNewBeneficiaryView.translatesAutoresizingMaskIntoConstraints = false
            
            buttonView.translatesAutoresizingMaskIntoConstraints = false
            
            buttonView.myButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
            
        }
    @objc func buttonAction(_ sender:UIButton!)
    {
        print("Button tapped")
        let vc = ViewController()
        vc.title = "Beneficiary Details"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func layout() {
        view.addSubview(stackView)
        view.addSubview(btnStackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 13),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 13)
        ])
        
        NSLayoutConstraint.activate([
            btnStackView.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            btnStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            btnStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            btnStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                
            ])
        
    }
    func setNavigationBar() {
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        let navigationbar = UINavigationBar(frame: CGRect(x: 0, y: startingYPos, width: self.view.bounds.width, height: 100));
        let navItem = UINavigationItem(title: "Add New Beneficiary")
        
        
        let leftbackButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: nil, action: nil)
        
        navigationbar.tintColor = .white
        navItem.leftBarButtonItem = leftbackButton

        UINavigationBar.appearance().barTintColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        navigationbar.setItems([navItem], animated: false)
        view.addSubview(navigationbar)
    }
    
    func changeStatusBarColor() {
            if #available(iOS 13.0, *) {
                let app = UIApplication.shared
                let statusBarHeight: CGFloat = app.statusBarFrame.size.height
                
                let statusbarView = UIView()
                statusbarView.backgroundColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
                view.addSubview(statusbarView)
              
                statusbarView.translatesAutoresizingMaskIntoConstraints = false
                statusbarView.heightAnchor
                    .constraint(equalToConstant: statusBarHeight).isActive = true
                statusbarView.widthAnchor
                    .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
                statusbarView.topAnchor
                    .constraint(equalTo: view.topAnchor).isActive = true
                statusbarView.centerXAnchor
                    .constraint(equalTo: view.centerXAnchor).isActive = true
              
            } else {
                let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
                statusBar?.backgroundColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
            }
        }
}

