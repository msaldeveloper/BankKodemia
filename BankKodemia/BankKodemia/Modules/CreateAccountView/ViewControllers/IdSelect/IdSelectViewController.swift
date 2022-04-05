//
//  IdSelectViewController.swift
//  BankKodemia
//
//  Created by MacBook on 22/03/22.
//

import UIKit
import Combine

class IdSelectViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    
    // SuggestDetailInfo: Indicaciones de la seccion
    var infoSuggestLabel : UILabel = UILabel()
    
    // IdSelectorButtons: Botones
    var ineView : UIView = UIView()
    var passportView : UIView = UIView()
    var immigrantDocumentView : UIView = UIView()
    
    var ineButton : UIButton = UIButton()
    var passportButton : UIButton = UIButton()
    var immigrantDocumentButton : UIButton = UIButton()
    
    var ineButtonLabel : UILabel = UILabel()
    var passportButtonLabel : UILabel = UILabel()
    var immigrantDocumentButtonlabel : UILabel = UILabel()
    
    var arrowButton : UIImageView = UIImageView()
    var ineRightArrow : UIImageView = UIImageView()
    var passportRightArrow : UIImageView = UIImageView()
    var immigrantDocumentRightArrow : UIImageView = UIImageView()
        
    //Legal Information
    var legalButton: UIButton = UIButton()
    var legalTextLabel: UILabel = UILabel()
    
    // Boton para continuar
    var incomingButton: UIButton = UIButton()
    
    var alerta = ""
    private var createNewAccountViewModel = CreateNewAccountViewModel()
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
        suggestDetailInfoSection()
        ineSelectorButton()
        immigrantDocumentSelectorButton()
        passportSelectorButton()
        legalInformationSection()
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func suggestDetailInfoSection(){
        
        infoSuggestLabel = UILabel()
        infoSuggestLabel.text = Text.CreateAccount.IdSelect.TopMessage
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
    }
    
    func ineSelectorButton(){
        
        ineView  = UIView()
        ineView.formatUIViewClear(activate: true)
        view.addSubview(ineView )
        ineView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
        
        
        ineButton.formatPhantom()
        ineButton.addTarget(self, action: #selector(continueIneButton), for: .touchUpInside)
        ineView.addSubview(ineButton)
        ineButton.addAnchorsAndSize(width: nil, height: 42, left: 10, top: 0, right: 0, bottom: 0)
        ineButton.addLabelDarkGray(button: ineButton, text: Text.CreateAccount.IdSelect.Ine)
        
        ineButtonLabel = UILabel()
        ineButtonLabel.textColor = .black
        ineButtonLabel.text = Text.CreateAccount.IdSelect.Ine
        ineButton.addSubview(ineButtonLabel)
        
        ineView.addSubview(ineRightArrow)
        ineRightArrow.arrowButtonIdentity(view: view)

    }
    
    func immigrantDocumentSelectorButton(){
        
        immigrantDocumentView = UIView()
        immigrantDocumentView.formatUIViewClear(activate: true)
        view.addSubview(immigrantDocumentView )
        immigrantDocumentView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: ineView)
        
        
        immigrantDocumentButton.formatPhantom()
        immigrantDocumentButton.addTarget(self, action: #selector(continueImmigrantButton), for: .touchUpInside)
        immigrantDocumentView.addSubview(immigrantDocumentButton)
        immigrantDocumentButton.addAnchorsAndSize(width: nil, height: 42, left: 10, top: 0, right: 0, bottom: 0)
        immigrantDocumentButton.addLabelDarkGray(button: immigrantDocumentButton, text: Text.CreateAccount.IdSelect.ImmigrantDoc)
        
        immigrantDocumentButtonlabel = UILabel()
        immigrantDocumentButtonlabel.textColor = .black
        immigrantDocumentButtonlabel.text = Text.CreateAccount.IdSelect.ImmigrantDoc
        immigrantDocumentButton.addSubview(immigrantDocumentButtonlabel)
        
        immigrantDocumentView.addSubview(immigrantDocumentRightArrow)
        immigrantDocumentRightArrow.arrowButtonIdentity(view: view)
        
    }
    
    func passportSelectorButton(){
        
        passportView = UIView()
        passportView.formatUIViewClear(activate: true)
        view.addSubview(passportView)
        passportView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: immigrantDocumentView)
        
        
        passportButton.formatPhantom()
        passportButton.addTarget(self, action: #selector(continuePassportButton), for: .touchUpInside)
       
        passportView.addSubview(passportButton)
        passportButton.addAnchorsAndSize(width: nil, height: 42, left: 10, top: 0, right: 0, bottom: 0)
        passportButton.addLabelDarkGray(button: passportButton, text: Text.CreateAccount.IdSelect.Passport)
        
        passportButtonLabel = UILabel()
        passportButtonLabel.textColor = .black
        passportButtonLabel.text = Text.CreateAccount.IdSelect.Passport
        passportButton.addSubview(passportButtonLabel)
        
        
        passportView.addSubview(passportRightArrow)
        passportRightArrow.arrowButtonIdentity(view: view)
        
    }
    
    func legalInformationSection(){
        
        legalButton = UIButton()
        legalButton.formatTransparent()
        legalButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
        view.addSubview(legalButton)
        legalButton.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: 21, bottom: 100)
                        
        legalTextLabel = UILabel()
        legalTextLabel.text = Text.CreateAccount.IdSelect.BottomMessage
        legalTextLabel.numberOfLines = 0
        legalTextLabel.font = UIFont(name: "Poppins", size: 17)
        legalTextLabel.textAlignment = .center
        legalButton.addSubview(legalTextLabel)
        legalTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: 0, bottom: 20)

    }
    
    //suscriptor
    fileprivate func validationBind(){
        self.createNewAccountViewModel
            .validationState
            .sink{ newAlertText in
               print("esperando acceso ->",newAlertText)
                if newAlertText == "access"{
                    
                    
                }else {
                    print("new alert -->>",newAlertText)
                    self.updateAlert(newAlertText)
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

}

// MARK: - OBJC Functions
extension IdSelectViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueIneButton(){
        print("INE button pressed")
        let idSelected = ineButtonLabel.text ?? ""
        self.createNewAccountViewModel.idSelectValidator(idSelected)
        print("ID seleccionado:", ineButtonLabel.text ?? "")
        continueButton()
    }
    
    @objc func continuePassportButton(){
        print("Passport button pressed")
        let idSelected = passportButtonLabel.text ?? ""
        self.createNewAccountViewModel.idSelectValidator(idSelected)
        print("ID seleccionado:", passportButtonLabel.text ?? "")
        continueButton()
    }
    
    @objc func continueImmigrantButton(){
        print("Immigrant button pressed")
        let idSelected = immigrantDocumentButtonlabel.text ?? ""
        self.createNewAccountViewModel.idSelectValidator(idSelected)
        print("ID seleccionado:", immigrantDocumentButtonlabel.text ?? "")
        
        continueButton()
    }
    
    @objc func continueButton(){
       print("continue button pressed")
        let uploadViewController = UploadViewController()
        uploadViewController.modalPresentationStyle = .fullScreen
        present(uploadViewController, animated: true, completion: nil)
    }
}
