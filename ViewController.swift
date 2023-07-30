//
//  ViewController.swift
//  HW9
//
//  Created by Justin Lee on 11/19/21.
//

import UIKit
import SVProgressHUD
import Highcharts
import SwiftSpinner

protocol NavProtocol: class{
    func createpage(name:String)
    func createtab()
}

class ViewController: UINavigationController, NavProtocol {
    func createtab() {
        pushViewController(sixthVC, animated: true)
    }
    
    
    func createpage(name:String) {
        let p = ThirdViewController()
        print("createPage")
        p.name = name
        p.ispress = 1
        pushViewController(p, animated: true)
    }
    
    
    
    public var myGlobal = "GAGAGA"
    
    var firstVC = FirstViewController()
    var secondVC = SecondViewController()
    var thirdVC = ThirdViewController()
    var forthVC = ForthViewController()
    var fifthVC = FifthViewController()
    var sixthVC = SixthViewController()
    var eighthVC = EighthViewController()
    let pageVC = PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    //var navVC = UINavigationController(rootViewController: rootVC)
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dat = SingletonClass.shared.requestForUser()
        
        var backB = UIBarButtonItem()
        backB.title = "Nav"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backB
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        pageVC.navProtocol = self
        // Do any additional setup after loading the view.
        //createButton()
        //createButton2()
        loadview1()
        
        
        
        
        //navigationItem.searchController = searchController
        //SVProgressHUD.show()
        //SVProgressHUD.setDefaultMaskType(.black)
        //SVProgressHUD.show(withStatus: "YAY")
    }
    
   
    
    
    
    
    func createButton(){
        
        let butt = UIButton(type: UIButton.ButtonType.custom)
        //butt.buttonType = UIButton.ButtonType.custom
        butt.frame = CGRect(x:65,y:180,width:300,height:150)
        //butt.center = view.center
        //butt.configuration = .myButton1()
        butt.tag = 100
        butt.addTarget(self, action: #selector(buttonTapped1), for: .touchUpInside)
        view.addSubview(butt)
        
    }
    func createButton2(){
        let butt=UIButton(frame: CGRect(x:0,y:0,width:200,height:50))
        //butt.center = view.convert(, to: )
        butt.configuration = .myButton2()
        butt.tag = 101
        butt.addTarget(self, action: #selector(self.buttonTapped1), for: .touchUpInside)
        view.addSubview(butt)
    }
    //@objc
    //@IBAction
    @objc private func testtap(){
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        pushViewController(vc, animated: true)
    }
    
    @objc func loadview1() {
        //SwiftSpinner.show(duration: 4.0, title: "Loading...")
        pushViewController(pageVC, animated: true)
    }
    @IBAction func buttonTapped1(sender : UIButton) {
        //let vc = UIViewController()
        //vc.view.backgroundColor = .white
        //sixthVC.reloadInputView
        pushViewController(sixthVC, animated: true)
        //navigationController?.popViewController(animated: true)
        //popToRootViewController(animated: true)
        /*pushViewController(thirdVC, animated: true)
        if let viewWithTag = self.view.viewWithTag(99) {
               viewWithTag.removeFromSuperview()
           }else{
               print("No!")
           }
        if let viewWithTag = self.view.viewWithTag(101) {
               viewWithTag.removeFromSuperview()
           }else{
               print("No!")
           }*/
        createButton()
    }
    
    
    
}

extension UIButton.Configuration{
 static func myButton1()->UIButton.Configuration{
     var config: UIButton.Configuration = .filled()
     config.title = ""
     config.subtitle = ""
     config.titleAlignment = .center
     config.cornerStyle = .medium
     config.showsActivityIndicator = true
     return config
 }
    static func myButton2()->UIButton.Configuration{
        var config: UIButton.Configuration = .filled()
        config.title = "Third VC!"
        config.subtitle = "subtitle"
        config.titleAlignment = .center
        config.cornerStyle = .medium
        config.showsActivityIndicator = true
        return config
    }
   
}



