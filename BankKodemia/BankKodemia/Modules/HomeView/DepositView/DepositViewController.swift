//
//  DepositViewController.swift
//  BankKodemia
//
//  Created by Mariela Torres on 04/04/22.
//
import UIKit
import Combine

class DepositViewController: UIViewController {
    
    let width = ConstantsUIKit.width
    let height = ConstantsUIKit.height
    lazy var logo : UIImageView = UIImageView()
    lazy var backButton : UIButton = UIButton()
    lazy var titleView : UILabel = UILabel()
    
    lazy var shipToLabel : UILabel = UILabel()
    
    lazy var quantityLabel : UILabel = UILabel()
    lazy var quantityTextField : UITextField = UITextField()
    lazy var quantityDetail : UILabel = UILabel()
    
    lazy var conceptLabel : UILabel = UILabel()
    lazy var conceptBackground : UIView = UIView()
    lazy var conceptTextField : UITextView = UITextView()
    
    lazy var makeDepositButton : UIButton = UIButton()
    
    var alerta = ""
    private var depositViewModel = DepositViewModel()
    private var cancellables: [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        validationBind()
        //Looks for single or multiple taps.
             let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
    }
    
    func initUI(){
        
        view.addSubview(logo)
        logo.logoFormart(view: view)
        
        view.addSubview(backButton)
        backButton.backButton(view: view, textDinamic: TextLocals.send_cash_top_message, widthText: width/3)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        view.addSubview(titleView)
        titleView.formartTitle(view: view, textTitle: "DEPOSITAR")
        
        shipToLabel.text = "Deposita en tu cuenta"
        shipToLabel.font = ConstantsFont.f16Normal
        view.addSubview(shipToLabel)
        shipToLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shipToLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shipToLabel.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 3*height/120),
            shipToLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9),
            shipToLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/20)
        ])
        
        
        quantityLabel.text = TextLocals.send_cash_quantity_message
        quantityLabel.font = ConstantsFont.f14SemiBold
        quantityLabel.textColor = .darkGray
        view.addSubview(quantityLabel)
        quantityLabel.listDetails(view: view, previous: shipToLabel, height: 1/30)
        
        quantityTextField.borderStyle = .none
        quantityTextField.placeholder = "$0.0"
        quantityTextField.textAlignment = .center
        quantityTextField.font = ConstantsFont.f20SemiBold
        view.addSubview(quantityTextField)
        quantityTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quantityTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quantityTextField.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 0),
            quantityTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9),
            quantityTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/30)
        ])
        
        quantityDetail.text = "MXN"
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

        conceptBackground.backgroundColor = ConstantsUIColor.greyKodemia
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
        
        makeDepositButton.formartBlueGreen()
        view.addSubview(makeDepositButton)
        makeDepositButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            makeDepositButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            makeDepositButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -height/16),
            makeDepositButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/9),
            makeDepositButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/20)
        ])
        
        makeDepositButton.addLabelWhite(button: makeDepositButton, text: "Depositar")
        makeDepositButton.addTarget(self, action: #selector(depositButton), for: .touchUpInside)
    
    }
    
    //suscriptor
    fileprivate func validationBind(){
        self.depositViewModel
            .validationState
            .sink{ newAlertText in
               print("esperando acceso ->",newAlertText)
                if newAlertText == "access"{
//                    self.sesionActiva()
                    print("access")
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
    
}
// MARK: - OBJC Functions
extension DepositViewController {
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    
    @objc func depositButton(){
        print("deposit button pressed")
        self.depositViewModel.depositValidator(quantityTextField.text ?? "", self.conceptTextField.text ?? "")
        
    }
}
