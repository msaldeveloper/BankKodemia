//
//  ProfileViewController.swift
//  BankKodemia
//
//  Created by Mario Saldana on 05/04/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let width = ConstantsUIKit.width
    let height = ConstantsUIKit.height
    
    lazy var countButton : UIImageView = UIImageView()
    lazy var logo : UIImageView = UIImageView()
    lazy var helpButton : UIImageView = UIImageView()
    
    lazy var backButton : UIButton = UIButton()
    
    lazy var titleView : UILabel = UILabel()
    
    lazy var idLabel : UILabel = UILabel()
    lazy var idDetail : UILabel = UILabel()

    lazy var nameLabel : UILabel = UILabel()
    
    lazy var emailLabel : UILabel = UILabel()
    lazy var emailDetailLabel : UILabel = UILabel()
    
    lazy var exitButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        initUI()
    }
    
    var user : UserModel = UserModel(_id: "", email: "", name: "", lastName: "")
    
    init(user: UserModel){
        super.init(nibName: nil, bundle: nil)
        
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI(){
   
        view.addSubview(logo)
        logo.logoFormart(view: view)
        
        view.addSubview(backButton)
        backButton.backButton(view: view, textDinamic: TextLocals.tab_bar_init, widthText: width/7)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        view.addSubview(titleView)
        titleView.formartTitle(view: view, textTitle: Text.Profile.titleProfile)
        
//        view.addSubview(idLabel)
        nameLabel.text = "\(user.name) \(user.lastName)"
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = ConstantsFont.f20SemiBold
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 3*height/120),
            nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9)
        ])
        
        idLabel.text = Text.Profile.idProfile
        idLabel.font = ConstantsFont.f14SemiBold
        idLabel.textColor = .darkGray
        view.addSubview(idLabel)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            idLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant:height/7),
            idLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9),
            idLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/30)
        ])
        
        idDetail.text = user._id
        idDetail.font = ConstantsFont.f14Regular
        idDetail.textColor = ConstantsUIColor.greyKodemia
        view.addSubview(idDetail)
        idDetail.listDetails(view: view, previous: idLabel, height: 2/30)
        
        
        emailLabel.text = Text.Profile.emailProfile
        emailLabel.font = ConstantsFont.f14SemiBold
        emailLabel.textColor = .darkGray
        view.addSubview(emailLabel)
        emailLabel.listDetails(view: view, previous: idDetail, height: 1/30)
        
        emailDetailLabel.text = user.email
        emailDetailLabel.font = ConstantsFont.f14Regular
        emailDetailLabel.textColor = ConstantsUIColor.greyKodemia
        view.addSubview(emailDetailLabel)
        emailDetailLabel.listDetails(view: view, previous: emailLabel, height: 2/30)
        
        
        exitButton.setImage(UIImage(named: "log-out"), for: .normal)
        exitButton.addTarget(self, action:#selector(exit) , for: .touchUpInside)
        view.addSubview(exitButton)
        exitButton.addAnchorsAndSize(width: nil, height: nil, left: 21, top: 70, right: 18, bottom: nil, withAnchor: .top, relativeToView: emailDetailLabel)
        
    }
    
}

// MARK: - OBJC Functions
extension ProfileViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func exit(){
        let alerta = UIAlertController(title: "Cerrar Sesion", message: "¿Desea cerrar sesión?", preferredStyle: .alert)
        let aceptar = UIAlertAction(title: "Acceptar", style: .default) { _ in
            UserDefaults.standard.removeObject(forKey: "correo")
            let exit = WelcomeViewController()
            exit.modalPresentationStyle = .fullScreen
            self.present(exit,animated: true,completion: nil )
        }
        let cancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alerta.addAction(aceptar)
        alerta.addAction(cancelar)
        present(alerta, animated: true, completion: nil)
    }
}
