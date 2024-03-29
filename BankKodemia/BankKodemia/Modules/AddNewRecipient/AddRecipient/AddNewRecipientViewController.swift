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
    var clabeLabel : UIButton = UIButton()
    var cardLabel : UIButton = UIButton()
    var contactButton : UIButton = UIButton()
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
    
    var labelClabe = UILabel()
    var labelCard = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        initUI()
    }
    func tokenBind(){
        
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
        contactButtonComponent()
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
        //clabeLabel.addLabelDark(button: clabeLabel, text: Text.AddNewRecipient.ClabeLabel)
        clabeLabel.addSubview(labelClabe)
        labelClabe.font = ConstantsFont.f18SemiBold
        labelClabe.textColor = ConstantsUIColor.greenBlue
        labelClabe.textAlignment = .left
        labelClabe.text = Text.AddNewRecipient.ClabeLabel
        labelClabe.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelClabe.leadingAnchor.constraint(equalTo: clabeLabel.leadingAnchor, constant: 0),
            labelClabe.topAnchor.constraint(equalTo: clabeLabel.topAnchor, constant: 0),
            labelClabe.widthAnchor.constraint(equalTo: clabeLabel.widthAnchor, multiplier: 1),
            labelClabe.heightAnchor.constraint(equalTo: clabeLabel.heightAnchor, multiplier: 1)
        ])
        let clabeButton = UITapGestureRecognizer(target: self, action: #selector(clabeButtonAction))
        clabeLabel.addGestureRecognizer(clabeButton)
        clabeLabel.addAnchorsAndSize(width: nil, height: 27, left: 0, top: 2, right: nil, bottom: nil)
        
        labelsNav.addSubview(cardLabel)
        //cardLabel.addLabelDark(button: cardLabel, text: Text.AddNewRecipient.CardLabel)
        cardLabel.addSubview(labelCard)
        labelCard.font = ConstantsFont.f18SemiBold
        labelCard.textColor = .black
        labelCard.textAlignment = .left
        labelCard.text = Text.AddNewRecipient.CardLabel
        labelCard.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelCard.leadingAnchor.constraint(equalTo: cardLabel.leadingAnchor, constant: 0),
            labelCard.topAnchor.constraint(equalTo: cardLabel.topAnchor, constant: 0),
            labelCard.widthAnchor.constraint(equalTo: cardLabel.widthAnchor, multiplier: 1),
            labelCard.heightAnchor.constraint(equalTo: cardLabel.heightAnchor, multiplier: 1)
        ])
        let cardButton = UITapGestureRecognizer(target: self, action: #selector(cardButtonAction))
        cardLabel.addGestureRecognizer(cardButton)
        cardLabel.addAnchorsAndSize(width: nil, height: 27, left: width/3.5, top: 2, right: nil, bottom: nil)
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
        textFieldDigitLabelTop.textColor = .black
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
        textFieldNumOfCardTop.textColor = .black
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
        textFieldInstitutionTop.textColor = .black
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
        textFieldNameTop.textColor = .black
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
        textFieldEmailTop.textColor = .black
        textFieldEmailTop.text = Text.AddNewRecipient.EmailLabel
        textFieldEmailTop.font = UIFont(name: "Poppins-Medium", size: 16)
        view.addSubview(textFieldEmailTop)
        textFieldEmailTop.addAnchorsAndSize(width: nil, height: nil, left: 21, top: nil, right: nil, bottom: 2, withAnchor: .bottom, relativeToView: textFieldEmail)
    }
    func contactButtonComponent(){
        contactButton.formartBlueGreen()
        contactButton.addTarget(self, action: #selector(contactButtonAction), for: .touchUpInside)
        view.addSubview(contactButton)
        contactButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: 20, right: 21, bottom: nil, withAnchor: .top, relativeToView: fieldEmail)
    
        contactButton.addLabelWhite(button: contactButton, text: Text.AddNewRecipient.ListUsers)
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
    
    @objc func clabeButtonAction(){
        textFieldDigitLabelTop.text = Text.AddNewRecipient.DigitsLabel
        labelClabe.textColor = ConstantsUIColor.greenBlue
        labelCard.textColor = ConstantsUIColor.blackKodemia

    }
    @objc func cardButtonAction(){
        textFieldDigitLabelTop.text = Text.AddNewRecipient.CardNumberLabel
        labelCard.textColor = ConstantsUIColor.greenBlue
        labelClabe.textColor = ConstantsUIColor.blackKodemia
        
    }
    @objc func contactButtonAction(){
        print("move to list usersViewController")
        let ListUsersViewController = ListUsersViewController()
        ListUsersViewController.modalPresentationStyle = .fullScreen
        self.present(ListUsersViewController,animated: true, completion: nil )
        
    }
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func addContact(){
        print("add contact button pressed")
    }
}
