//
//  TabCardViewController.swift
//  BankKodemia
//
//  Created by Mariela Torres on 24/03/22.
//

import Foundation
import UIKit

class HomeCardViewController: UIViewController {

    let width = ConstantsUIKit.width
    let height = ConstantsUIKit.height
    
    lazy var countButton : UIImageView = UIImageView()
    lazy var logo : UIImageView = UIImageView()
    lazy var helpButton : UIImageView = UIImageView()
    lazy var cardTitle : UILabel = UILabel()
//    lazy var contentStackView : UIStackView = UIStackView()
    lazy var cardImage : UIImageView = UIImageView()
    lazy var cardNumberLabel : UILabel = UILabel()
    lazy var cardNumber : UILabel = UILabel()
    lazy var validityLabel : UILabel = UILabel()
    lazy var validity : UILabel = UILabel()
    lazy var cvvLabel : UILabel = UILabel()
    lazy var cvv : UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        initUI()
    }
    
    func initUI(){
        
        view.addSubview(countButton)
        countButton.countFormart(view: view)
        
        view.addSubview(helpButton)
        helpButton.helpFormart(view: view)
        
        view.addSubview(logo)
        logo.logoFormart(view: view)
        
        cardTitle = UILabel(frame: CGRect(x: width/18, y: 11*height/80, width: 29*width/72, height: height/40))
        cardTitle.text = TextLocals.home_card_top_message
        cardTitle.font = .systemFont(ofSize: 50)
        cardTitle.adjustsFontSizeToFitWidth = true
        view.addSubview(cardTitle)
        
        // Configurando stack
//        contentStackView.axis = .vertical
//        contentStackView.spacing = 50
//        contentStackView.alignment = .fill
//        contentStackView.distribution = .fill
//
//        view.addSubview(contentStackView)
//        contentStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            contentStackView.topAnchor.constraint(equalTo: cardTitle.bottomAnchor),
//            contentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            contentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
        
//        contentStackView.addArrangedSubview(cardImage)
        view.addSubview(cardImage)
        cardImage.image = UIImage(named: "creditcard")
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cardNumberLabel)
        cardNumberLabel.text = TextLocals.home_card_number_of_card_message
        cardNumberLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        cardNumberLabel.textAlignment = .left
        cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cardNumber)
        cardNumber.text = "4444 4444 4444 4444"
        cardNumber.font = UIFont(name: "Poppins-Regular", size: 14)
        cardNumber.textAlignment = .left
        cardNumber.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(validityLabel)
        validityLabel.text = TextLocals.home_card_validity_message
        validityLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        validityLabel.textAlignment = .left
        validityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(validity)
        validity.text = "11/26"
        validity.font = UIFont(name: "Poppins-Regular", size: 14)
        validity.textAlignment = .left
        validity.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cvvLabel)
        cvvLabel.text = TextLocals.home_card_cvv_message
        cvvLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        cvvLabel.textAlignment = .left
        cvvLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cvv)
        cvv.text = "125"
        cvv.font = UIFont(name: "Poppins-Regular", size: 14)
        cvv.textAlignment = .left
        cvv.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: cardTitle.bottomAnchor),
            cardImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            cardImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            cardImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardNumberLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20 ),
            cardNumberLabel.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 40),
            cardNumberLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            cardNumber.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20 ),
            cardNumber.topAnchor.constraint(equalTo: cardNumberLabel.bottomAnchor),
            cardNumber.widthAnchor.constraint(equalTo: view.widthAnchor),
            validityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            validityLabel.topAnchor.constraint(equalTo: cardNumber.bottomAnchor, constant: 20),
            validityLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            validity.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            validity.topAnchor.constraint(equalTo: validityLabel.bottomAnchor),
            validity.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            cvvLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            cvvLabel.leadingAnchor.constraint(equalTo: validityLabel.trailingAnchor),
            cvvLabel.topAnchor.constraint(equalTo: cardNumber.bottomAnchor, constant: 20),
            cvv.topAnchor.constraint(equalTo: cvvLabel.bottomAnchor),
            cvv.leadingAnchor.constraint(equalTo: validity.trailingAnchor),
            cvv.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
    }

}
