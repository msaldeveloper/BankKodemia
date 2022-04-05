//
//  UploadViewController.swift
//  BankKodemia
//
//  Created by MacBook on 22/03/22.
//

import UIKit
import Combine

class UploadViewController: UIViewController {
    
    lazy var logo : UIImageView = UIImageView()
    lazy var imagen : UIImageView = UIImageView()
    
    // SuggestDetailInfo: Indicaciones de la seccion
    var infoSuggestLabel : UILabel = UILabel()
    //UploadBox
    var uploadboxView : UIView = UIView()
    //laber subir
    var uploadboxLabel : UILabel = UILabel()
    //Boton subir imagen
    var uploadboxButton : UIButton = UIButton()
    // Boton para continuar
    var uploadButton : UIButton = UIButton()
    
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
        uploadBoxSection()
        uploadButtonSection()
    
        
       
    }
    
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    
    func suggestDetailInfoSection(){
        
        infoSuggestLabel = UILabel()
        infoSuggestLabel.textColor = .black
        infoSuggestLabel.text = Text.CreateAccount.Uploading.TopMessage
        infoSuggestLabel.font = UIFont(name: "Poppins-Medium", size: 20)
        infoSuggestLabel.textAlignment = .left
        infoSuggestLabel.lineBreakMode = .byWordWrapping
        infoSuggestLabel.numberOfLines = 0
        view.addSubview(infoSuggestLabel)
        infoSuggestLabel.addAnchorsAndSize(width: nil, height: nil, left: 21, top: height/10, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
    }
    
    func uploadBoxSection(){
        
        uploadboxView = UIView()
        uploadboxView.formatUIViewDash(activate: false)
        view.addSubview(uploadboxView)
        uploadboxView.addAnchorsAndSize(width: nil, height: height/4, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
        
        imagen = UIImageView()
        view.addSubview(imagen)
        imagen.addAnchorsAndSize(width: nil, height: height/4, left: 21, top: height/20, right: 21, bottom: nil, withAnchor: .top, relativeToView: infoSuggestLabel)
        
        
        uploadboxButton.formatGray()
        uploadboxButton.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
        uploadboxView.addSubview(uploadboxButton)
        uploadboxButton.addAnchorsAndSize(width: nil, height: 42, left: 0, top: 0, right: 0, bottom: 0)
        uploadboxButton.addLabelUploader(button: uploadboxButton, text: Text.CreateAccount.Uploading.BottonUploadMessage)

        
    }
    
    func uploadButtonSection(){
        
        uploadButton.formartBlueGreen()
        uploadButton.addTarget(self, action: #selector(upload), for: .touchUpInside)
        view.addSubview(uploadButton)
        uploadButton.addAnchorsAndSize(width: nil, height: 42, left: 21, top: nil, right: 21, bottom: 46)
        
        uploadButton.addLabelWhite(button: uploadButton, text: Text.CreateAccount.Uploading.BottonMessage)
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
    
    @objc func uploadImage(){
        let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
                
            present(imagePicker, animated: true, completion: nil)
    }
    
}

// MARK: - OBJC Functions
extension UploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            picker.dismiss(animated: true, completion: nil)
            let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            
               
               imagen.image = pickedImage
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true)
        }
    
    
    @objc func backAction(){
        print("back button pressed")
        dismiss(animated: true)
    }
    @objc func linkAction(){
        print("link pressed")
    }
    
    @objc func upload(){
        print("upload file")
        
        let imageIdUploaded = TextAlerts.base64
        self.createNewAccountViewModel.uploadValidator(imageIdUploaded)
        //print("image64:", imageIdUploaded)
        let createPasswordViewController = CreatePasswordViewController()
        createPasswordViewController.modalPresentationStyle = .fullScreen
        present(createPasswordViewController, animated: true, completion: nil)
        
    }

}
