//
//  SuccessFullScreenViewController.swift
//  BankKodemia
//
//  Created by Mario Saldana on 05/04/22.
//

import UIKit

class SuccessFullScreenViewController: UIViewController {
    var backgroundColor = ConstantsUIColor.clearBackground
    var logo : UIImageView = UIImageView()
    var personsImage : UIImageView = UIImageView()
    var bottomImageLabel : UILabel = UILabel()
    var backToInit : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        initUI()
    }
    func initUI(){
        logoComponent()
        centerImage()
        bottomImageLabelComponent()
        backToInitButtonComponent()
    }
    func logoComponent(){
        view.addSubview(logo)
        logo.logoFormart(view: view
        )
    }
    func centerImage(){
        view.addSubview(personsImage)
        personsImage.image = UIImage(named: "icon")
        personsImage.contentMode = .scaleAspectFit
        personsImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            personsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personsImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: (height/20)*2),
            //personsImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
            personsImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
        ])
    }
    func bottomImageLabelComponent(){
        view.addSubview(bottomImageLabel)
        //bottomImageLabel.formartTitle(view: view, textTitle: Text.AddNewRecipient.ImageBottomLabel)
        bottomImageLabel.textColor = .black
        bottomImageLabel.text = Text.AddNewRecipient.ImageBottomLabelSuccess
        bottomImageLabel.textColor = UIColor.darkText
        bottomImageLabel.textAlignment = .center
        bottomImageLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        bottomImageLabel.addAnchorsAndSize(width: nil, height: 30, left: 16, top: 10, right: 16, bottom: nil, withAnchor: .top, relativeToView: personsImage)
        
    }
    func backToInitButtonComponent(){
        backToInit.formartBlueGreen()
        backToInit.addTarget(self, action: #selector(backToInitActionn), for: .touchUpInside)
        view.addSubview(backToInit)
        backToInit.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        backToInit.addLabelWhite(button: backToInit, text: Text.AddNewRecipient.BackToInitButton)
    }

}
// MARK: - OBJC Functions
extension SuccessFullScreenViewController {
    @objc func backToInitActionn(){
        let homeViewModel = HomeViewController()
        homeViewModel.modalPresentationStyle = .fullScreen
        present(homeViewModel,animated: true,completion:{print("home back")} )
    }
}
