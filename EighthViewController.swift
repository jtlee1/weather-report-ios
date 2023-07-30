//
//  EighthViewController.swift
//  HW9
//
//  Created by Justin Lee on 12/5/21.
//

import UIKit

class EighthViewController: UIViewController, UIScrollViewDelegate{
    @IBOutlet weak var b1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    weak var pageProtocol: PageProtocol?
    
    @IBAction func test(_ sender: UIButton) {
        print("hihi")
        self.pageProtocol?.deletepage()
        
    }
}
