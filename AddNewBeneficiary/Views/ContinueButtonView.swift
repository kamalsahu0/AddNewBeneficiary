//
//  BottomViewController.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 07/02/23.
//

import UIKit

class ContinueButtonView: UIView {
    
    let continueBtn = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layOut()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension of ContinueButtonView
extension ContinueButtonView {
    func style()
    {
        translatesAutoresizingMaskIntoConstraints = false
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
        continueBtn.setTitle("Continue", for: .normal)
        continueBtn.configuration = .filled()
        continueBtn.tintColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
        //myButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    }
    
    func layOut()
    {
        addSubview(continueBtn)
        
        NSLayoutConstraint.activate([
            continueBtn.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            continueBtn.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: continueBtn.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: continueBtn.bottomAnchor, multiplier: 5)
            
        ])
    }
//    @objc func buttonAction(_ sender:UIButton!)
//    {
//        print("ContinueButton tapped")
//        let vc = ViewController()
//        vc.title = "Beneficiary Details"
//        navigationController?.pushViewController(vc, animated: true)
//    }
}
