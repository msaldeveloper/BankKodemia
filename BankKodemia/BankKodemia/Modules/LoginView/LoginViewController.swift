//
//  LoginViewController.swift
//  BankKodemia
//
//  Created by Mario Saldana on 17/03/22.
//

import UIKit
var arrowButton: UIButton?
var initSessionLabel: UILabel?
var initSessionWelcomeLabel: UILabel?
var backgroundColor = ConstantsUIColor.clearBackground

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        UIInit()

        // Do any additional setup after loading the view.
    }
    
    
    func UIInit(){
        returnButton()
        //returnLabel()
        welcomeLabel()
//        emailField()
//        passwordField()
//        helpLabel()
//        initSessionButton()
    }
    
    func returnButton(){
        
        arrowButton = UIButton()
        arrowButton?.backButton("return")
//        arrowButton?.setImage(UIImage(named: "back"), for: .normal)
        //arrowButton?.backgroundColor = .red
        arrowButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(arrowButton!)
        arrowButton?.addAnchorsAndSize(width: 200, height: nil, left: 20.5, top: 90, right: nil, bottom: nil)
    }
    
    func returnLabel(){
        initSessionLabel = UILabel()
        initSessionLabel?.text = TextLocals.init_session_top_message
        initSessionLabel?.font = UIFont(name: "some", size: 14)
        view.addSubview(initSessionLabel!)
        initSessionLabel?.addAnchorsAndSize(width: 107, height: 21, left: 22.5, top: 85, right: nil, bottom: nil, withAnchor: .left, relativeToView: arrowButton)
        //, withAnchor: <#T##Anchor?#>, relativeToView: <#T##UIView?#>
    }
    func welcomeLabel(){
        initSessionWelcomeLabel = UILabel()
        initSessionWelcomeLabel?.text = TextLocals.init_session_description_message
        initSessionWelcomeLabel?.font = UIFont(name: "some", size: 16)
        initSessionWelcomeLabel?.textAlignment = .left
        initSessionWelcomeLabel?.lineBreakMode = .byWordWrapping
        initSessionWelcomeLabel?.numberOfLines = 0
        view.addSubview(initSessionWelcomeLabel!)
        initSessionWelcomeLabel?.addAnchorsAndSize(width: nil, height: nil, left: 21, top: 24, right: 21, bottom: nil, withAnchor: .top, relativeToView: initSessionLabel)
    }
    
    

}
// MARK: - OBJC Functions
extension LoginViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
}
