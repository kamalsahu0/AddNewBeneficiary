//
//  ViewController.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 07/02/23.
//
import UIKit

class AddNewBeneficiaryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStatusBarColor()
        setNavigationBar()
        style()
        layout()
    }
    
    // MARK: - ScrollView
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 10, y: 90, width: view.bounds.width - 20, height: view.bounds.height)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: 850)
        scrollView.isPagingEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    lazy var addNewBeneficiaryView = AddNewBeneficiaryView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 50))
    
    
    // MARK: - AddNewBeneficiary Stack view
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.frame = CGRect(x: 0, y: 20, width: scrollView.frame.width, height: 690)
        view.axis = .vertical
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    // MARK: - ContinueBtn Stack view
    lazy var btnStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [buttonView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.backgroundColor = .white
        return view
    }()
    
}
// MARK: - Extension AddNewBeneficiaryViewController Style and layout
extension AddNewBeneficiaryViewController  {
    
    // MARK: - style
    private func style(){
        
        view.backgroundColor = .secondarySystemBackground
        addNewBeneficiaryView.translatesAutoresizingMaskIntoConstraints = false
        bankSltBtn.addTarget(self, action: #selector(bnkSltButtonTapped(_:)), for: .touchUpInside)
        selectAccTypeBtn.addTarget(self, action: #selector(selectAccTypeBtnTapped(_:)), for: .touchUpInside)
        
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        continueBtn.addTarget(self, action: #selector(continueBtnAction(_:)), for: .touchUpInside)
    }
    
    // MARK: - layout Constraints
    private func layout() {
        stackView.addArrangedSubview(addNewBeneficiaryView)
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        view.addSubview(btnStackView)
        
        // MARK: - stackView
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        // MARK: - button Stackview
        NSLayoutConstraint.activate([
            // btnStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 2),
            btnStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            btnStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            btnStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    //Continue btn Tapped
    @objc func continueBtnAction(_ sender:UIButton!)
    {
        selectBankType(bnkSltText: bnkSltTextLabel)
        
        selectAccType(sltAccTypeText: sltAccTypeTextLabel)
        
        if validateForm() {
            print("Submit")
        }
        else
        {
            print("invalid form")
        }
    }
}

// MARK: - Extension AddNewBeneficiaryViewController for PopOver View Controller
extension AddNewBeneficiaryViewController: UIPopoverPresentationControllerDelegate {
    
    func showPopover(_ sender: UIButton, dataArray: [String], label: UILabel, constantValue: String, ifscLabel: UILabel?, ifscCode: UILabel?, dividerLabel: UIView?, dataModel: [DataModel]?) {
        
        // Create a view controller to display in the popover
        let contentViewController = PopOverTableViewController(dataArray: dataArray, label: label, constantValue: constantValue, ifscLabel: ifscLabel, ifscCode: ifscCode, dividerLabel: dividerLabel, dataModel: dataModel)
        
        contentViewController.preferredContentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 2.5)
        
        // Create the popover presentation controller
        contentViewController.modalPresentationStyle = .popover
        if let popoverController = contentViewController.popoverPresentationController {
            popoverController.delegate = self
            popoverController.sourceView = sender
            popoverController.sourceRect =  CGRect(x:CGRectGetMidX(sender.bounds), y: CGRectGetMidY(sender.bounds),width: UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height/2.25 )
            popoverController.permittedArrowDirections = []
        }
        
        // Present the popover
        present(contentViewController, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Ensure that the popover is displayed on iPhones as well
        return .none
    }
    
    func selectBankType(bnkSltText: UILabel?)  {
        
        if bnkSltText?.text == selectBankConst
        {
            let refreshAlert = UIAlertController(title: "Kotak Mahindra Bank", message: "Please select the Bank", preferredStyle: UIAlertController.Style.alert)
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(refreshAlert, animated: true, completion: nil)
        }
        else
        {
            debugPrint("Bank Selected")
        }
    }
    
    func selectAccType(sltAccTypeText: UILabel?) {
        
        if sltAccTypeText?.text == sltAccTypeConst
        {
            let refreshAlert = UIAlertController(title: "Kotak Mahindra Bank", message: "Please select the account type", preferredStyle: UIAlertController.Style.alert)
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(refreshAlert, animated: true, completion: nil)
        }
        else
        {
            debugPrint("Account type Selected")
        }
    }
    
    
    @objc func bnkSltButtonTapped(_ sender: UIButton) {
        
        showPopover(sender, dataArray: jsonData?[0].selectBank.map({ bnk in
            bnk.bankName
        }) ?? [], label: bnkSltTextLabel, constantValue: selectBankConst, ifscLabel: ifsclabel, ifscCode: ifscCode, dividerLabel: dividerLabel, dataModel: jsonData)
    }
    
    @objc func selectAccTypeBtnTapped(_ sender: UIButton){
        showPopover(sender, dataArray: jsonData?[0].selectAccType ?? [], label: sltAccTypeTextLabel, constantValue: sltAccTypeConst, ifscLabel: nil, ifscCode: nil, dividerLabel: nil, dataModel: nil)
    }
}

