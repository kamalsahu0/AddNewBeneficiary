//
//  ViewController.swift
//  AddNewBeneficiary
//
//  Created by Kamal Sahu on 07/02/23.
//
import UIKit

class AddNewBeneficiaryViewController: UIViewController {
    
    var buttonView = ContinueButtonView()
    
    let selectBank = ["Select Bank",
                      "KOTAK MAHINDRA BANK",
                      "AXIS BANK",
                      "BANK OF BARODA",
                      "BANK OF INDIA",
                      "BANK OF MAHARASHTRA",
                      "CANARA BANK",
                      "CENTRAL BANK OF INDIA"]
    
    let selectAccType = ["Select account type", "Saving", "Current", "Overdraft", "Cash Credit", "Loan", "NRE", "Credit Card"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStatusBarColor()
        setNavigationBar()
        style()
        layout()
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 10, y: 90, width: view.bounds.width - 20, height: view.bounds.height)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: 1000)
        scrollView.isPagingEnabled = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var addNewBeneficiaryView = AddNewBeneficiaryView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 50))

    
    // MARK: - AddNewBeneficiary Stack view
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 690)
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
        addNewBeneficiaryView.bankSltBtn.addTarget(self, action: #selector(bnkSltButtonTapped(_:)), for: .touchUpInside)
        addNewBeneficiaryView.selectAccTypeBtn.addTarget(self, action: #selector(selectAccTypeBtnTapped(_:)), for: .touchUpInside)
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.continueBtn.addTarget(self, action: #selector(continueBtnAction(_:)), for: .touchUpInside)
    }
    
    // MARK: - layout Constraints
    private func layout() {
        stackView.addArrangedSubview(addNewBeneficiaryView)
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        view.addSubview(btnStackView)
        
        // MARK: - stackView
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        // MARK: - button Stackview
        NSLayoutConstraint.activate([
//            btnStackView.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            btnStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            btnStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            btnStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 30),

        ])
    }
    
    //Continue btn Tapped
    @objc func continueBtnAction(_ sender:UIButton!)
    {
        print("Button tapped")
//        let vc = ViewController()
//        vc.title = "Beneficiary Details"
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Set NavigationBar
    func setNavigationBar() {
        let startingYPos = UIApplication.shared.statusBarFrame.size.height;
        let navigationbar = UINavigationBar(frame: CGRect(x: 0, y: startingYPos, width: self.view.bounds.width, height: 100));
        let navItem = UINavigationItem(title: "Add New Beneficiary")
       
        navigationbar.tintColor = .white
        
        UINavigationBar.appearance().barTintColor = .init(red: 1, green: 0.1, blue: 0.1, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        navigationbar.setItems([navItem], animated: false)
        view.addSubview(navigationbar)
    }
    
    // MARK: - changeStatusBarColor
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

// MARK: - Extension AddNewBeneficiaryViewController for PopOver View Controller
extension AddNewBeneficiaryViewController: UIPopoverPresentationControllerDelegate {
    
    func showPopover(_ sender: UIButton, dataArray: [String], textField: UITextField) {
        
        // Create a view controller to display in the popover
        let contentViewController = PopOverTableViewController(dataArray: dataArray, textField: textField)
        contentViewController.preferredContentSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 3)
        
        // Create the popover presentation controller
        contentViewController.modalPresentationStyle = .popover
        if let popoverController = contentViewController.popoverPresentationController {
            popoverController.delegate = self
            popoverController.sourceView = sender
            popoverController.sourceRect =  CGRect(x:CGRectGetMidX(sender.bounds), y: CGRectGetMidY(sender.bounds),width: UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height/2.6 )
            popoverController.permittedArrowDirections = []
        }
        
        // Present the popover
        present(contentViewController, animated: true, completion: nil)
        
       
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Ensure that the popover is displayed on iPhones as well
        return .none
    }
    
    
    @objc func bnkSltButtonTapped(_ sender: UIButton) {
        showPopover(sender, dataArray: selectBank, textField: addNewBeneficiaryView.bnkSltTextField)
    }
    
    @objc func selectAccTypeBtnTapped(_ sender: UIButton){
        showPopover(sender, dataArray: selectAccType, textField: addNewBeneficiaryView.sltAccTypeTxt)
    }
}
