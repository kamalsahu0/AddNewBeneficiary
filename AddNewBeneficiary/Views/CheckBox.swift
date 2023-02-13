//
//  FooterButton.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 07/02/23.
//

import UIKit

import UIKit

class CheckBox: UIButton {
    // Images
    var checkedImage = UIImage()
    var uncheckedImage = UIImage()
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                checkedImage = UIImage(systemName: "ic_check_box")!
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                uncheckedImage = UIImage(systemName: "ic_check_box_outline_blank")!
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
