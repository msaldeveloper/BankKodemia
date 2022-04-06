//
//  DetailAccountViewController.swift
//  BankKodemia
//
//  Created by MacBook on 21/03/22.
//

import UIKit
import Combine
import SwiftUI

class DetailAccountViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    var arrowButton: UIButton = UIButton()
    var titleSuggestLabel: UILabel = UILabel()
    //var UIDatePicker : UIControl = UIControl()
    var selectedDate : String = String()
    var datePicker: UIDatePicker = UIDatePicker()
    // SuggestDetailInfo: Indicaciones de la seccion
    var infoSuggestDetailLabel: UILabel = UILabel()
    
    // DetailInfoFields: Indicaciones de la seccion
    var nameInfoFieldView: UIView = UIView()
    var lastNameInfoFieldView: UIView = UIView()
    var occupationInfoFieldView: UIView = UIView()
    var dateInfoFieldView: UIView = UIView()
    var infoFieldView: UIView = UIView()
    
    var nameInfoTextLabel: UILabel = UILabel()
    var latNameInfoTextLabel: UILabel = UILabel()
    var occupationInfoTextLabel: UILabel = UILabel()
    var dateInfoTextLabel: UILabel = UILabel()
    
    var nameInfoTextField: UITextField = UITextField()
    var lastNameInfoTextField: UITextField = UITextField()
    var occupationInfoTextField: UITextField = UITextField()
    var dateInfoTextField: UITextField = UITextField()
    
    //Legal Information
    var legalButton: UIButton = UIButton()
    var legalTextLabel: UILabel = UILabel()
    var legalTextLinkedLabel: UILabel = UILabel()
    
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
        returnButton()
        titleLabel()
        suggestDetailInfoSection()
        nameDetailInfoField()
        lastNameDetailInfoField()
        occupationDetailInfoField()
        dateDetailInfoField()
        continueButtonSection()
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func returnButton(){
        view.addSubview(arrowButton)
        arrowButton.backButton(view: view, textDinamic: TextLocals.init_session_top_email_input_message.uppercased(), widthText: width/2)
        arrowButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
    func titleLabel(){
        view.addSubview(titleSuggestLabel)
        titleSuggestLabel.formartTitle(view: view, textTitle: Text.CreateAccount.Detail.title)
    }
    
    func suggestDetailInfoSection(){
        
        infoSuggestDetailLabel = UILabel()
        infoSuggestDetailLabel.text = Text.CreateAccount.Detail.TopMessage
        infoSuggestDetailLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestDetailLabel.textColor = .black
        infoSuggestDetailLabel.textAlignment = .left
        infoSuggestDetailLabel.lineBreakMode = .byWordWrapping
        infoSuggestDetailLabel.numberOfLines = 0
        view.addSubview(infoSuggestDetailLabel)
        infoSuggestDetailLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
    }
    
    func nameDetailInfoField(){
        
        nameInfoFieldView = UIView()
        nameInfoFieldView.formatUIView(activate: false)
        view.addSubview(nameInfoFieldView)
        nameInfoFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestDetailLabel)
        
        nameInfoFieldView.addSubview(nameInfoTextField)
        nameInfoTextField.infoTextFielFormat()
        
        nameInfoTextLabel = UILabel()
        nameInfoTextLabel.textColor = .black
        nameInfoTextLabel.text = Text.CreateAccount.Detail.NameMessage
        nameInfoTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        nameInfoTextField.addSubview(nameInfoTextLabel)
        nameInfoTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: nameInfoFieldView)
        
    }
    
    func lastNameDetailInfoField(){
        
        lastNameInfoFieldView = UIView()
        lastNameInfoFieldView.formatUIView(activate: false)
        view.addSubview(lastNameInfoFieldView)
        lastNameInfoFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: nameInfoFieldView)
        
        lastNameInfoFieldView.addSubview(lastNameInfoTextField)
        lastNameInfoTextField.infoTextFielFormat()
        
        latNameInfoTextLabel = UILabel()
        latNameInfoTextLabel.textColor = .black
        latNameInfoTextLabel.text = Text.CreateAccount.Detail.LastNameMessage
        latNameInfoTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        lastNameInfoTextField.addSubview(latNameInfoTextLabel)
        latNameInfoTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: lastNameInfoFieldView)
        
    }
    
    func occupationDetailInfoField(){
        
        occupationInfoFieldView = UIView()
        occupationInfoFieldView.formatUIView(activate: false)
        view.addSubview(occupationInfoFieldView)
        occupationInfoFieldView.addAnchorsAndSize(width: nil, height: 37, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: lastNameInfoFieldView)
        
        occupationInfoFieldView.addSubview(occupationInfoTextField)
        occupationInfoTextField.infoTextFielFormat()
        
        occupationInfoTextLabel = UILabel()
        occupationInfoTextLabel.textColor = .black
        occupationInfoTextLabel.text = Text.CreateAccount.Detail.OcupationMessage
        occupationInfoTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        occupationInfoTextField.addSubview(occupationInfoTextLabel)
        occupationInfoTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: occupationInfoFieldView)
        
    }
    
    func dateDetailInfoField(){
        
        dateInfoFieldView = UIView()
        dateInfoFieldView.formatUIViewDate(activate: false)
        view.addSubview(dateInfoFieldView)
        dateInfoFieldView.addAnchorsAndSize(width: nil, height: 100, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: occupationInfoFieldView)
        
//        dateInfoFieldView.addSubview(dateInfoTextField)
//        dateInfoTextField.infoTextFielFormat()
        
        dateInfoTextLabel = UILabel()

        dateInfoTextLabel.textColor = .black
        dateInfoTextLabel.text = Text.CreateAccount.Detail.Date
        dateInfoTextLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        dateInfoFieldView.addSubview(dateInfoTextLabel)
        dateInfoTextLabel.addAnchorsAndSize(width: nil, height: nil, left: 0, top: nil, right: nil, bottom: 4, withAnchor: .bottom, relativeToView: dateInfoFieldView)

        //PICKER DATE
        datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = UIColor.white
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
        dateInfoFieldView.addSubview(datePicker)
        datePicker.addAnchorsAndSize(width: nil, height: 150, left: 0, top: 5, right: 0, bottom: 5, withAnchor: .top, relativeToView: dateInfoTextLabel)        
    }
    
    func continueButtonSection(){
        
        incomingButton.formartBlueGreen()
        incomingButton.addTarget(self, action: #selector(continueButton), for: .touchUpInside)
        view.addSubview(incomingButton)
        incomingButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        incomingButton.addLabelWhite(button: incomingButton, text: TextLocals.continue_button_message)
        
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
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
            
            // Create date formatter
            let dateFormatter: DateFormatter = DateFormatter()
            
            // Set date format
            dateFormatter.dateFormat = "yyyy/MM/dd"
            
            // Apply date format
            self.selectedDate = dateFormatter.string(from: sender.date)
            
            print("Selected value \(selectedDate)")
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    
    
    
    

}

// MARK: - OBJC Functions
extension DetailAccountViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    @objc func continueButton(){
        print("continue button pressed")
                
        let selected = self.selectedDate.replacingOccurrences(of: "/", with: "-", options: .literal, range: nil)
        print("Fecha de Nacimiento:", "\(selected)T00:00:00.022Z")
        self.createNewAccountViewModel.createAccountValidator(
            nameInfoTextField.text ?? "",
            lastNameInfoTextField.text ?? "",
            occupationInfoTextField.text ?? "",
            "\(selected)T00:00:00.022Z"
        )
        
        let phoneAccountViewController = PhoneAccountViewController()
        phoneAccountViewController.modalPresentationStyle = .fullScreen
        present(phoneAccountViewController, animated: true, completion: nil)
    }
}
