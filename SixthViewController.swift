//
//  SixthViewController.swift
//  HW9
//
//  Created by Justin Lee on 11/22/21.
//

import UIKit

class SixthViewController: UIViewController, UITabBarControllerDelegate {

    
    
    
    var forthVC = ForthViewController()
    var fifthVC = FifthViewController()
    var seventhVC = SeventhViewController()
    @IBOutlet weak var tit1: UILabel!
    @IBOutlet weak var twitter: UIButton!
    @IBOutlet var tabBarCnt: UITabBarController!
    //var tabBarCnt: UITabBarController!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let dat = SingletonClass.shared.requestForUser()
        tit1.text = dat.fname
        
       
        //self.tabBarController?.selectedIndex = 1
        self.tabBarCnt.selectedIndex = 0
        //let dat = SingletonClass.shared.requestForUser()
        //self.navigationItem.title = dat.fname
        //createTabBarController()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //.backBarButtonItem = UIBarButtonItem(title: "Weather", style: .plain, target: nil, action: nil)
        let dat = SingletonClass.shared.requestForUser()
        //tit1.text = dat.fname
        //let dat = SingletonClass.shared.requestForUser()
        //self.navigationItem.title = dat.fname
        createTabBarController()
        // Do any additional setup after loading the view.
    }

    
    func createTabBarController(){
        
        tabBarCnt = UITabBarController()
        tabBarCnt.delegate = self
        //tabBarCnt.tabBar.barStyle = .blackOpaque
        //setTitle("WEATHER DATA", andImage: UIImage(named: "Weather_Data_Tab.png")!)
        //forthVC.title = "WEATHER DATA"
        
        
        let ta = UITabBarItem(title: "WEATHER DATA", image: UIImage(named: "Weather_Data_Tab.png")!, tag: 11)
        forthVC.tabBarItem = ta
        let tb = UITabBarItem(title: "WEEKLY", image: UIImage(named: "Weekly_Tab.png")!, tag: 12)
        fifthVC.tabBarItem = tb
        let tc = UITabBarItem(title: "TODAY", image: UIImage(named: "Today_Tab.png")!, tag: 13)
        seventhVC.tabBarItem = tc
        
        tabBarCnt.viewControllers = [seventhVC, fifthVC, forthVC]
        
        //tabBarCnt.viewControllers = [fifthVC, forthVC, seventhVC]
        tabBarCnt.view.frame = self.view.bounds
        self.view.addSubview(tabBarCnt.view)
        
    }
    
    
    
    @IBAction func tweet(_ sender: UIButton) {
        print("BUTTON TAP")
    }
    //@IBAction func tweet(_sender : UIButton) {
        //print("BUTTON TAP")
        //if let url = URL(string: "http://www.google.com") {
        //    UIApplication.shared.open(url)
        //}
    //}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

