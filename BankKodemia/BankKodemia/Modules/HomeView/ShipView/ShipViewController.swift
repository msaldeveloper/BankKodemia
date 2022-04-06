//
//  ShipViewController.swift
//  BankKodemia
//
//  Created by Felipe Nery Guevara Guevara on 24/03/22.
//

import UIKit

class ShipViewController: UIViewController{
    
    let width = ConstantsUIKit.width
    let height = ConstantsUIKit.height
    lazy var logo : UIImageView = UIImageView()
    lazy var backButton : UIButton = UIButton()
    lazy var titleView : UILabel = UILabel()
    
    lazy var shipToLabel : UILabel = UILabel()
    lazy var shipToNameDetail : UILabel = UILabel()
    lazy var shipToCountDetail : UILabel = UILabel()
    
    lazy var moneySign : UILabel = UILabel()
    lazy var quantityLabel : UILabel = UILabel()
    lazy var quantityTextField : UITextField = UITextField()
    lazy var quantityDetail : UILabel = UILabel()
    
    lazy var conceptLabel : UILabel = UILabel()
    lazy var conceptCounLabel : UILabel = UILabel()
    lazy var conceptBackground : UIView = UIView()
    lazy var conceptTextField : UITextView = UITextView()
    
    lazy var makeTransferButton : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        quantityTextField.delegate = self
        conceptTextField.delegate = self
    }
    
    func initUI(){
        
        view.addSubview(logo)
        logo.logoFormart(view: view)
        
        view.addSubview(backButton)
        backButton.backButton(view: view, textDinamic: TextLocals.send_cash_top_message, widthText: width/3)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        view.addSubview(titleView)
        titleView.formartTitle(view: view, textTitle: TextLocals.send_cash_transfer_message)
        
        shipToLabel.text = TextLocals.send_cash_sent_to
        shipToLabel.font = ConstantsFont.f14SemiBold
        shipToLabel.textColor = .darkGray
        view.addSubview(shipToLabel)
        shipToLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shipToLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shipToLabel.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 3*height/120),
            shipToLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9),
            shipToLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/30)
        ])
        
        shipToNameDetail.text = "Cruz Eduardo Reveles Caldera"
        shipToNameDetail.font = ConstantsFont.f14SemiBold
        shipToNameDetail.textColor = .black
        view.addSubview(shipToNameDetail)
        shipToNameDetail.listDetails(view: view, previous: shipToLabel, height: 1/30)
        
        shipToCountDetail.text = "1234 1234 1234 1234 / BANORTE"
        shipToCountDetail.textColor = ConstantsUIColor.greyKodemia
        shipToCountDetail.font = ConstantsFont.f14Regular
        view.addSubview(shipToCountDetail)
        shipToCountDetail.listDetails(view: view, previous: shipToNameDetail, height: 1/30)
        
        quantityLabel.text = TextLocals.send_cash_quantity_message
        quantityLabel.font = ConstantsFont.f14SemiBold
        quantityLabel.textColor = .darkGray
        view.addSubview(quantityLabel)
        quantityLabel.listDetails(view: view, previous: shipToCountDetail, height: 1/30)
        
        quantityTextField.borderStyle = .none
        quantityTextField.placeholder = "0.0"
        quantityTextField.textAlignment = .center
        quantityTextField.font = ConstantsFont.f20SemiBold
        view.addSubview(quantityTextField)
        quantityTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quantityTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quantityTextField.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 0),
            quantityTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/30)
        ])
        
        moneySign.backgroundColor = .clear
        moneySign.textColor = .black
        moneySign.text = "$"
        moneySign.font = ConstantsFont.f20SemiBold
        view.addSubview(moneySign)
        moneySign.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moneySign.centerYAnchor.constraint(equalTo: quantityTextField.centerYAnchor),
            moneySign.trailingAnchor.constraint(equalTo: quantityTextField.leadingAnchor, constant: 0),
        ])
        
        quantityDetail.text = TextLocals.send_cash_spei_message
        quantityDetail.font = ConstantsFont.f14Normal
        quantityDetail.textColor = ConstantsUIColor.greenBlue
        quantityDetail.textAlignment = .center
        view.addSubview(quantityDetail)
        quantityDetail.listDetails(view: view, previous: quantityTextField, height: 1/30)
        
        conceptLabel.text = TextLocals.home_concept_message
        conceptLabel.font = ConstantsFont.f14SemiBold
        conceptLabel.textColor = .darkGray
        view.addSubview(conceptLabel)
        conceptLabel.listDetails(view: view, previous: quantityDetail, height: 1/30)
        
        conceptCounLabel.font = ConstantsFont.f14Regular
        conceptCounLabel.textColor = ConstantsUIColor.greyKodemia
        view.addSubview(conceptCounLabel)
        conceptCounLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            conceptCounLabel.centerYAnchor.constraint(equalTo: conceptLabel.centerYAnchor),
            conceptCounLabel.leadingAnchor.constraint(equalTo: conceptLabel.trailingAnchor, constant: -19*width/30),
        ])
        
        conceptBackground.backgroundColor = ConstantsUIColor.greyBackGround
        conceptBackground.layer.cornerRadius = 10
        view.addSubview(conceptBackground)
        conceptBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            conceptBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            conceptBackground.topAnchor.constraint(equalTo: conceptLabel.bottomAnchor, constant: 0),
            conceptBackground.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9),
            conceptBackground.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/30)
        ])
        
        conceptTextField.font = ConstantsFont.f14Regular
        conceptTextField.backgroundColor = .clear
        view.addSubview(conceptTextField)
        conceptTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            conceptTextField.topAnchor.constraint(equalTo: conceptBackground.topAnchor, constant: height/1000),
            conceptTextField.bottomAnchor.constraint(equalTo: conceptBackground.bottomAnchor, constant: -height/1000),
            conceptTextField.leadingAnchor.constraint(equalTo: conceptBackground.leadingAnchor, constant: height/1000),
            conceptTextField.trailingAnchor.constraint(equalTo: conceptBackground.trailingAnchor, constant: -height/1000)
        ])
        
        makeTransferButton.formartBlueGreen()
        view.addSubview(makeTransferButton)
        makeTransferButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            makeTransferButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            makeTransferButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -height/10),
            makeTransferButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9),
            makeTransferButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/20)
        ])
        
        makeTransferButton.addLabelWhite(button: makeTransferButton, text: TextLocals.send_cash_transfer_button)
        
        
    }
    
}
// MARK: - OBJC Functions
extension ShipViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
}
// MARK: - Extension UITextView
extension ShipViewController: UITextViewDelegate{
    
    func textViewDidChange(_ textView: UITextView) {
        conceptCounLabel.text = String(conceptTextField.text.count) + "/40"
        if conceptTextField.text.count == 41 {
            conceptCounLabel.text = "40/40"
            conceptTextField.text.remove(at: conceptTextField.text.index(before: conceptTextField.text.endIndex))
        }
    }
    
}

// MARK: - Extension UITextField
extension ShipViewController: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if quantityTextField.text?.count == 21{
            quantityTextField.text?.remove(at: (quantityTextField.text?.index(before: quantityTextField.text!.endIndex))!)
        }
    }
    
}
