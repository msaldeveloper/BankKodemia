//
//  LoginViewController.swift
//  BankKodemia
//
//  Created by Mario Saldana on 17/03/22.
//

import UIKit
import Combine


class LoginViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    var arrowButton: UIButton = UIButton()
    var initSessionLabel: UILabel = UILabel()
    var initSessionWelcomeLabel: UILabel = UILabel()
    var textFieldLabelTop: UILabel = UILabel()
    var fieldEmail : UIView = UIView()
    var textFieldEmail: UITextField = UITextField()
    var passwordFieldLabelTop: UILabel = UILabel()
    var fieldPassword : UIView = UIView()
    var textFieldPassword: UITextField = UITextField()
    var helpMessageLabel: UILabel = UILabel()
    var linkMessageButton: UIButton = UIButton()
    var linkMessageLabel: UILabel = UILabel()
    var initSessionBottomButton: UIButton = UIButton()
    var initSessionButtonLabel: UILabel = UILabel()
    var alerta = ""
    private var loginViewModel = LoginViewModel()
    private var cancellables: [AnyCancellable] = []

    var backgroundColor = ConstantsUIColor.clearBackground

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        UIInit()
        validationBind()
        //Looks for single or multiple taps.
             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    func UIInit(){
        logoImage()
        returnButton()
        titleLabel()
        welcomeLabel()
        emailField()
        passwordField()
        helpLabel()
        initSessionButton()
    }
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func returnButton(){
        view.addSubview(arrowButton)
        arrowButton.backButton(view: view, textDinamic: TextLocals.init_session_back_message, widthText: width/4)
        arrowButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    func titleLabel(){
        view.addSubview(initSessionLabel)
        initSessionLabel.formartTitle(view: view, textTitle: TextLocals.init_session_top_message)
    }
    func welcomeLabel(){
        initSessionWelcomeLabel.text = TextLocals.init_session_description_message
        initSessionWelcomeLabel.font = ConstantsFont.f16Normal
        initSessionWelcomeLabel.textColor = .black
        initSessionWelcomeLabel.textAlignment = .left
        initSessionWelcomeLabel.lineBreakMode = .byWordWrapping
        initSessionWelcomeLabel.numberOfLines = 0
        view.addSubview(initSessionWelcomeLabel)
        initSessionWelcomeLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: 24, right: 21, bottom: nil, withAnchor: .top, relativeToView: initSessionLabel)
    }
    
    func emailField(){
        fieldEmail = UIView()
        fieldEmail.formatUIView(activate: false)
        view.addSubview(fieldEmail)
        fieldEmail.addAnchorsAndSize(width: nil, height: 37, left: 21, top: 46, right: 21, bottom: nil, withAnchor: .top, relativeToView: initSessionWelcomeLabel)
        
        textFieldEmail = UITextField()
        textFieldEmail.formatTextField(TextLocals.init_session_email_input_message)
        textFieldEmail.keyboardType = .emailAddress
        fieldEmail.addSubview(textFieldEmail)
        textFieldEmail.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 0, right: 10, bottom: 0)
        
        
        
        textFieldLabelTop = UILabel()
        textFieldLabelTop.text = TextLocals.init_session_top_email_input_message
        textFieldLabelTop.font = ConstantsFont.f14Normal
        textFieldLabelTop.textColor = .black
        view.addSubview(textFieldLabelTop)
        textFieldLabelTop.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: nil, bottom: 2, withAnchor: .bottom, relativeToView: textFieldEmail)
    }
    func passwordField(){
        fieldPassword = UIView()
        fieldPassword.formatUIView(activate: false)
        view.addSubview(fieldPassword)
        fieldPassword.addAnchorsAndSize(width: nil, height: 37, left: 21, top: 45, right: 21, bottom: nil, withAnchor: .top, relativeToView: fieldEmail)
        
        textFieldPassword = UITextField()
        textFieldPassword.formatTextField(TextLocals.init_session_password_input_message)
        textFieldPassword.isSecureTextEntry = true
        fieldPassword.addSubview(textFieldPassword)
        textFieldPassword.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 0, right: 10, bottom: 0)
        
        
        
        passwordFieldLabelTop = UILabel()
        passwordFieldLabelTop.text = TextLocals.init_session_top_password_input_message
        passwordFieldLabelTop.font = ConstantsFont.f14Normal
        passwordFieldLabelTop.textColor = .black
        view.addSubview(passwordFieldLabelTop)
        passwordFieldLabelTop.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: nil, bottom: 2, withAnchor: .bottom, relativeToView: textFieldPassword)
    }
    
    func initSessionButton(){
        initSessionBottomButton.formartBlueGreen()
        initSessionBottomButton.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
        view.addSubview(initSessionBottomButton)
        initSessionBottomButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        initSessionBottomButton.addLabelWhite(button: initSessionBottomButton, text: TextLocals.continue_button_message)
        
    }
    
    func helpLabel(){
        linkMessageButton = UIButton()
        linkMessageButton.formatTransparent()
        linkMessageButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        view.addSubview(linkMessageButton)
        linkMessageButton.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom: 120)
        
        linkMessageLabel = UILabel()
        linkMessageLabel.formatPurpleLink()
        linkMessageLabel.font = ConstantsFont.f14Normal
        linkMessageLabel.text = TextLocals.init_session_help_link
        linkMessageLabel.textAlignment = .center
        linkMessageButton.addSubview(linkMessageLabel)
        linkMessageLabel.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 10, right: 10, bottom: 0)
        
        helpMessageLabel = UILabel()
        helpMessageLabel.text = TextLocals.init_session_help_message
        helpMessageLabel.font = ConstantsFont.f14Normal
        helpMessageLabel.textColor = ConstantsUIColor.greyKodemia
        helpMessageLabel.textAlignment = .center
        linkMessageLabel.addSubview(helpMessageLabel)
        helpMessageLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom:  ConstantsUIKit.height/50 + 5)
        
        
        
    }
    //suscriptor
    fileprivate func validationBind(){
        self.loginViewModel
            .validationState
            .sink{ newAlertText in
               print("esperando acceso ->",newAlertText)
                if newAlertText == "access"{
                    self.sesionActiva()
                }else {
                    print("new alert -->>",newAlertText)
                    self.updateAlert(newAlertText)//self.sesionActiva()
                }
            }
            .store(in: &cancellables)
    }
    
    func updateAlert(_ alertText: String){
        alerta = alertText
        print(alertText)
        let alert = UIAlertController(title: "Error :(", message: alerta, preferredStyle: .alert)
        let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(aceptar)
        self.present(alert, animated: true, completion: nil)
    }
    func sesionActiva(){
            print("Estamos logueados")
        
    
            let  tabBarVC = UITabBarController()
            let home = HomeViewController()
            let target = HomeCardViewController()
            let services = ShipViewController()//HomeServicesViewController()
            //let logOut = ViewController()
            home.title = "INICIO"
            target.title = "TARJETA"
            services.title = "SERVICIOS"
            //logOut.title = "LogOut"
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().tintColor = ConstantsUIColor.greenBlue
            //UITabBar.appearance().isTranslucent = true
            UITabBar.appearance().backgroundColor = UIColor.black
    //        home.tabBarItem.image = UIImage(named: "casa25")
    //        search.tabBarItem.image = UIImage(named: "search25")
            //logOut.tabBarItem.image = UIImage(named: "logout25")
            tabBarVC.setViewControllers([home,target,services], animated: false)
            tabBarVC.modalPresentationStyle = .fullScreen
            present(tabBarVC, animated: true, completion: nil)
            }
    }

    extension UITabBar {
        static func setAppearanceTabbar(){
            UITabBar.appearance().backgroundColor = .red
        }
    
    }
// MARK: - OBJC Functions
extension LoginViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")
        self.loginViewModel.loginValidator(self.textFieldEmail.text ?? "", self.textFieldPassword.text ?? "")
        
    }
}
