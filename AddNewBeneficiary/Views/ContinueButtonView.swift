//
//  BottomViewController.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 07/02/23.
//

import UIKit

class ContinueButtonView: UIView {

    let myButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layOut()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
extension ContinueButtonView
{
    func style()
    {
        translatesAutoresizingMaskIntoConstraints = false
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.setTitle("Continue", for: .normal)
        //myButton.isEnabled = false
        
        myButton.configuration = .filled()
        myButton.tintColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
        myButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
    }
    func layOut()
    {
        addSubview(myButton)
        
        NSLayoutConstraint.activate([
            myButton.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            myButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: myButton.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: myButton.bottomAnchor, multiplier: 5)
            
        ])
    }
    @objc func buttonAction(_ sender:UIButton!)
    {
        
        print("Button tapped")
        let vc = ViewController()
        vc.title = "Beneficiary Details"
    
       
    }
    
   
}
