//
//  HomeServicesViewController.swift
//  BankKodemia
//
//  Created by Mario Saldana on 19/03/22.
//

import UIKit

class HomeServicesViewController: UIViewController {
    lazy var logo : UIImageView = UIImageView()
    var initSessionLabel :UILabel = UILabel()
    var serviceCard1: UIView = UIView()
    var serviceCard2: UIView = UIView()
    var serviceCard3: UIView = UIView()
    var serviceCard4: UIView = UIView()
    var serviceCard5: UIView = UIView()
    var serviceCard6: UIView = UIView()
    var boldTextField : UILabel = UILabel()
    var simpleTextField : UILabel = UILabel()
    var tabBarVC : UITabBarController = UITabBarController()
    
    
    var backgroundColor = ConstantsUIColor.clearBackground

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        UIInit()

        // Do any additional setup after loading the view.
    }
    func UIInit(){
        logoImage()
        titleLabel()
        card()
        //tabBar()
    }
    func logoImage(){
        view.addSubview(logo)
        logo.logoFormart(view: view)
    }
    func titleLabel(){
        initSessionLabel = UILabel()
        initSessionLabel.formatGreyText()
        initSessionLabel.text = TextLocals.home_services_top_message
        initSessionLabel.font = UIFont(name: "some", size: 14)
        initSessionLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        //initSessionLabel.backgroundColor = .red
        view.addSubview(initSessionLabel)
        initSessionLabel.translatesAutoresizingMaskIntoConstraints = false
        initSessionLabel.addAnchorsAndSize(width: 107, height: 21, left: 21, top: 35, right: 21, bottom: nil, withAnchor: .top, relativeToView: logo)
        
    }
    func card(){
        serviceCard1 = UIView()
        serviceCard1.formatUIView(activate: false)
        view.addSubview(serviceCard1)
        serviceCard1.addAnchorsAndSize(width: nil, height: 54, left: 21, top: 23, right: 21, bottom: nil, withAnchor: .top, relativeToView: initSessionLabel)
        
        boldTextField = UILabel()
        boldTextField.text = TextLocals.home_services_recharge_cell
        boldTextField.font = UIFont(name: "Poppins-Medium", size: 16)
        serviceCard1.addSubview(boldTextField)
        boldTextField.addAnchorsAndSize(width: nil, height: nil, left: 11, top: 5, right: nil, bottom: nil)
        
        simpleTextField = UILabel()
        simpleTextField.text = TextLocals.home_services_cell_companies
        simpleTextField.font = UIFont(name: "Poppins-Regular", size: 14)
        serviceCard1.addSubview(simpleTextField)
        simpleTextField.addAnchorsAndSize(width: nil, height: nil, left: 11, top: 1, right: nil, bottom:  nil, withAnchor: .top, relativeToView: boldTextField)
        
        serviceCard2 = UIView()
        serviceCard2.formatUIView(activate: false)
        view.addSubview(serviceCard2)
        serviceCard2.addAnchorsAndSize(width: nil, height: 54, left: 21, top: 17, right: 21, bottom: nil, withAnchor: .top, relativeToView: serviceCard1)
        
        boldTextField = UILabel()
        boldTextField.text = TextLocals.home_services_recharge_cell
        boldTextField.font = UIFont(name: "Poppins-Medium", size: 16)
        serviceCard2.addSubview(boldTextField)
        boldTextField.addAnchorsAndSize(width: nil, height: nil, left: 11, top: 5, right: nil, bottom: nil)
        
        simpleTextField = UILabel()
        simpleTextField.text = TextLocals.home_services_cell_companies
        simpleTextField.font = UIFont(name: "Poppins-Regular", size: 14)
        serviceCard2.addSubview(simpleTextField)
        simpleTextField.addAnchorsAndSize(width: nil, height: nil, left: 11, top: 1, right: nil, bottom:  nil, withAnchor: .top, relativeToView: boldTextField)
        
        serviceCard3 = UIView()
        serviceCard3.formatUIView(activate: false)
        view.addSubview(serviceCard3)
        serviceCard3.addAnchorsAndSize(width: nil, height: 54, left: 21, top: 17, right: 21, bottom: nil, withAnchor: .top, relativeToView: serviceCard2)
        
        boldTextField = UILabel()
        boldTextField.text = TextLocals.home_services_recharge_cell
        boldTextField.font = UIFont(name: "Poppins-Medium", size: 16)
        serviceCard3.addSubview(boldTextField)
        boldTextField.addAnchorsAndSize(width: nil, height: nil, left: 11, top: 5, right: nil, bottom: nil)
        
        simpleTextField = UILabel()
        simpleTextField.text = TextLocals.home_services_cell_companies
        simpleTextField.font = UIFont(name: "Poppins-Regular", size: 14)
        serviceCard3.addSubview(simpleTextField)
        simpleTextField.addAnchorsAndSize(width: nil, height: nil, left: 11, top: 1, right: nil, bottom:  nil, withAnchor: .top, relativeToView: boldTextField)
        
        serviceCard4 = UIView()
        serviceCard4.formatUIView(activate: false)
        view.addSubview(serviceCard4)
        serviceCard4.addAnchorsAndSize(width: nil, height: 54, left: 21, top: 17, right: 21, bottom: nil, withAnchor: .top, relativeToView: serviceCard3)
        
        boldTextField = UILabel()
        boldTextField.text = TextLocals.home_services_recharge_cell
        boldTextField.font = UIFont(name: "Poppins-Medium", size: 16)
        serviceCard4.addSubview(boldTextField)
        boldTextField.addAnchorsAndSize(width: nil, height: nil, left: 11, top: 5, right: nil, bottom: nil)
        
        simpleTextField = UILabel()
        simpleTextField.text = TextLocals.home_services_cell_companies
        simpleTextField.font = UIFont(name: "Poppins-Regular", size: 14)
        serviceCard4.addSubview(simpleTextField)
        simpleTextField.addAnchorsAndSize(width: nil, height: nil, left: 11, top: 1, right: nil, bottom:  nil, withAnchor: .top, relativeToView: boldTextField)
        
        serviceCard5 = UIView()
        serviceCard5.formatUIView(activate: false)
        view.addSubview(serviceCard5)
        serviceCard5.addAnchorsAndSize(width: nil, height: 54, left: 21, top: 17, right: 21, bottom: nil, withAnchor: .top, relativeToView: serviceCard4)
        
        boldTextField = UILabel()
        boldTextField.text = TextLocals.home_services_recharge_cell
        boldTextField.font = UIFont(name: "Poppins-Medium", size: 16)
        serviceCard5.addSubview(boldTextField)
        boldTextField.addAnchorsAndSize(width: nil, height: nil, left: 11, top: 5, right: nil, bottom: nil)
        
        simpleTextField = UILabel()
        simpleTextField.text = TextLocals.home_services_cell_companies
        simpleTextField.font = UIFont(name: "Poppins-Regular", size: 14)
        serviceCard5.addSubview(simpleTextField)
        simpleTextField.addAnchorsAndSize(width: nil, height: nil, left: 11, top: 1, right: nil, bottom:  nil, withAnchor: .top, relativeToView: boldTextField)
        
        serviceCard6 = UIView()
        serviceCard6.formatUIView(activate: false)
        view.addSubview(serviceCard6)
        serviceCard6.addAnchorsAndSize(width: nil, height: 54, left: 21, top: 17, right: 21, bottom: nil, withAnchor: .top, relativeToView: serviceCard5)
        
        boldTextField = UILabel()
        boldTextField.text = TextLocals.home_services_recharge_cell
        boldTextField.font = UIFont(name: "Poppins-Medium", size: 16)
        serviceCard6.addSubview(boldTextField)
        boldTextField.addAnchorsAndSize(width: nil, height: nil, left: 11, top: 5, right: nil, bottom: nil)
        
        simpleTextField = UILabel()
        simpleTextField.text = TextLocals.home_services_cell_companies
        simpleTextField.font = UIFont(name: "Poppins-Regular", size: 14)
        serviceCard6.addSubview(simpleTextField)
        simpleTextField.addAnchorsAndSize(width: nil, height: nil, left: 11, top: 1, right: nil, bottom:  nil, withAnchor: .top, relativeToView: boldTextField)
    }
//    func tabBar(){
//
//        let  tabBarVC = UITabBarController()
//        //let home = ViewController()
//        //let logOut = ViewController()
//        home.title = "Home"
//        //logOut.title = "LogOut"
//        UITabBar.appearance().tintColor = .white
//        UITabBar.appearance().backgroundColor = UIColor.black
//        UITabBar.appearance().isTranslucent = true
//        //logOut.tabBarItem.image = UIImage(named: "logout25")
//
//
//        tabBarVC.setViewControllers([home], animated: false)
//        tabBarVC.modalPresentationStyle = .fullScreen
//        present(tabBarVC, animated: true, completion: nil)
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
