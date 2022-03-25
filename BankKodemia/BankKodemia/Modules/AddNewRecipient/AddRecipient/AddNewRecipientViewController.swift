//
//  AddNewRecipientViewController.swift
//  BankKodemia
//
//  Created by Mario Saldana on 25/03/22.
//

import UIKit

class AddNewRecipientViewController: UIViewController {
    var backgroundColor = ConstantsUIColor.clearBackground
    var arrowButton: UIButton = UIButton()
    var logo : UIImageView = UIImageView()
    var initSessionLabel : UILabel = UILabel()
    var clabeLabel : UILabel = UILabel()
    var cardLabel : UILabel = UILabel()
    var contactLabel : UILabel = UILabel()
    var labelsNav : UIView = UIView()
    
    var fieldDigit : UIView = UIView()
    var textFieldDigit : UITextField = UITextField()
    var textFieldDigitLabelTop : UILabel = UILabel()
    
    var fieldNumOfCard : UIView = UIView()
    var textFieldNumOfCard : UITextField = UITextField()
    var textFieldNumOfCardTop : UILabel = UILabel()
    
    var fieldInstitution : UIView = UIView()
    var textFieldInstitution : UITextField = UITextField()
    var textFieldInstitutionTop : UILabel = UILabel()
    
    var fieldName : UIView = UIView()
    var textFieldName : UITextField = UITextField()
    var textFieldNameTop : UILabel = UILabel()
    
    var fieldEmail : UIView = UIView()
    var textFieldEmail : UITextField = UITextField()
    var textFieldEmailTop : UILabel = UILabel()
    
    var addContactButton : UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        initUI()
    }
    func initUI(){
        logoComponent()
        backButtonComponent()
        titleLabel()
        labelsNavComponent()
        digitComponent()
        //numOfCardComponent()
        institutionComponent()
        nameTextComponent()
        emailComponent()
        addContactButtonComponent()
    }
    func logoComponent(){
        view.addSubview(logo)
        logo.logoFormart(view: view
        )
    }
    func backButtonComponent(){
        view.addSubview(arrowButton)
        arrowButton.backButton(view: view, textDinamic: Text.AddNewRecipient.BackButton , widthText: width/3)
        arrowButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    func titleLabel(){
        view.addSubview(initSessionLabel)
        initSessionLabel.formartTitle(view: view, textTitle: Text.AddNewRecipient.PageTitle)
    }
    func labelsNavComponent(){
        view.addSubview(labelsNav)
        labelsNav.formatUIViewClear(activate: true)
        labelsNav.addAnchorsAndSize(width: nil, height: 30, left: 21, top: 27, right: 21, bottom: nil, withAnchor: .top, relativeToView: initSessionLabel)
        
        labelsNav.addSubview(clabeLabel)
        clabeLabel.formatRecipientLabel(activate: true)
        clabeLabel.text = Text.AddNewRecipient.ClabeLabel
        clabeLabel.addAnchorsAndSize(width: nil, height: 27, left: 0, top: 2, right: nil, bottom: nil)
        
        labelsNav.addSubview(cardLabel)
        cardLabel.formatRecipientLabel(activate: false)
        cardLabel.text = Text.AddNewRecipient.CardLabel
        cardLabel.addAnchorsAndSize(width: nil, height: 27, left: width/2.8, top: 2, right: nil, bottom: nil)
    }
    func digitComponent(){
        fieldDigit.formatUIView(activate: false)
        view.addSubview(fieldDigit)
        fieldDigit.addAnchorsAndSize(width: nil, height: 37, left: 21, top: 46, right: 21, bottom: nil, withAnchor: .top, relativeToView: labelsNav)
        
        textFieldDigit = UITextField()
        textFieldDigit.formatTextField("")
        textFieldDigit.keyboardType = .emailAddress
        fieldDigit.addSubview(textFieldDigit)
        textFieldDigit.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 0, right: 10, bottom: 0)
        
        textFieldDigitLabelTop = UILabel()
        textFieldDigitLabelTop.text = Text.AddNewRecipient.DigitsLabel
        textFieldDigitLabelTop.font = UIFont(name: "Poppins-Medium", size: 16)
        view.addSubview(textFieldDigitLabelTop)
        textFieldDigitLabelTop.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: nil, bottom: 2, withAnchor: .bottom, relativeToView: textFieldDigit)
    }
    func numOfCardComponent(){
        fieldNumOfCard.formatUIView(activate: false)
        view.addSubview(fieldNumOfCard)
        fieldNumOfCard.addAnchorsAndSize(width: nil, height: 37, left: 21, top: 46, right: 21, bottom: nil, withAnchor: .top, relativeToView: labelsNav)
        
        textFieldNumOfCard = UITextField()
        textFieldNumOfCard.formatTextField("")
        textFieldNumOfCard.keyboardType = .emailAddress
        fieldNumOfCard.addSubview(textFieldNumOfCard)
        textFieldNumOfCard.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 0, right: 10, bottom: 0)
        
        textFieldNumOfCardTop = UILabel()
        textFieldNumOfCardTop.text = Text.AddNewRecipient.CardNumberLabel
        textFieldNumOfCardTop.font = UIFont(name: "Poppins-Medium", size: 16)
        view.addSubview(textFieldNumOfCardTop)
        textFieldNumOfCardTop.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: nil, bottom: 2, withAnchor: .bottom, relativeToView: textFieldNumOfCard)
    }
    func institutionComponent(){
        fieldInstitution.formatUIView(activate: false)
        view.addSubview(fieldInstitution)
        fieldInstitution.addAnchorsAndSize(width: nil, height: 37, left: 21, top: 126, right: 21, bottom: nil, withAnchor: .top, relativeToView: labelsNav)
        
        textFieldInstitution = UITextField()
        textFieldInstitution.formatTextField("")
        textFieldInstitution.keyboardType = .emailAddress
        fieldInstitution.addSubview(textFieldInstitution)
        textFieldInstitution.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 0, right: 10, bottom: 0)
        
        textFieldInstitutionTop = UILabel()
        textFieldInstitutionTop.text = Text.AddNewRecipient.InstitutionLabel
        textFieldInstitutionTop.font = UIFont(name: "Poppins-Medium", size: 16)
        view.addSubview(textFieldInstitutionTop)
        textFieldInstitutionTop.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: nil, bottom: 2, withAnchor: .bottom, relativeToView: textFieldInstitution)
    }
    func nameTextComponent(){
        fieldName.formatUIView(activate: false)
        view.addSubview(fieldName)
        fieldName.addAnchorsAndSize(width: nil, height: 37, left: 21, top: 44, right: 21, bottom: nil, withAnchor: .top, relativeToView: fieldInstitution)
        
        textFieldName = UITextField()
        textFieldName.formatTextField("")
        textFieldName.keyboardType = .emailAddress
        fieldName.addSubview(textFieldName)
        textFieldName.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 0, right: 10, bottom: 0)
        
        textFieldNameTop = UILabel()
        textFieldNameTop.text = Text.AddNewRecipient.NameLabel
        textFieldNameTop.font = UIFont(name: "Poppins-Medium", size: 16)
        view.addSubview(textFieldNameTop)
        textFieldNameTop.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: nil, bottom: 2, withAnchor: .bottom, relativeToView: textFieldName)
    }
    func emailComponent(){
        fieldEmail.formatUIView(activate: false)
        view.addSubview(fieldEmail)
        fieldEmail.addAnchorsAndSize(width: nil, height: 37, left: 21, top: 44, right: 21, bottom: nil, withAnchor: .top, relativeToView: fieldName)
        
        textFieldEmail = UITextField()
        textFieldEmail.formatTextField("")
        textFieldEmail.keyboardType = .emailAddress
        fieldEmail.addSubview(textFieldEmail)
        textFieldEmail.addAnchorsAndSize(width: nil, height: nil, left: 10, top: 0, right: 10, bottom: 0)
        
        textFieldEmailTop = UILabel()
        textFieldEmailTop.text = Text.AddNewRecipient.EmailLabel
        textFieldEmailTop.font = UIFont(name: "Poppins-Medium", size: 16)
        view.addSubview(textFieldEmailTop)
        textFieldEmailTop.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: nil, bottom: 2, withAnchor: .bottom, relativeToView: textFieldEmail)
    }
    func addContactButtonComponent(){
        addContactButton.formartBlueGreen()
        addContactButton.addTarget(self, action: #selector(addContact), for: .touchUpInside)
        view.addSubview(addContactButton)
        addContactButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        addContactButton.addLabelWhite(button: addContactButton, text: Text.AddNewRecipient.AddRecipientButton)
    }


}
// MARK: - OBJC Functions
extension AddNewRecipientViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func addContact(){
        print("add contact button pressed")
    }
}
