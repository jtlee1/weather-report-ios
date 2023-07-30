//
//  FirstViewController.swift
//  HW9
//
//  Created by Justin Lee on 11/20/21.
//

import UIKit
import SVProgressHUD
import Highcharts
import DropDown

class FirstViewController: UIViewController, UISearchBarDelegate{

    //let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
        
        // cell reuse id (cells that scroll out of view can be reused)
    //let cellReuseIdentifier = "cell"
    
var data: [String] = ["apple","appear","Azhar","code","BCom"]
var dataFiltered: [String] = []
var dropButton = DropDown()

@IBOutlet weak var searchBar: UISearchBar!

@IBOutlet weak var view1: UIView!
@IBOutlet weak var text1: UILabel!
@IBOutlet weak var img1: UIImageView!
@IBOutlet weak var text2: UILabel!
@IBOutlet weak var text3: UILabel!
@IBOutlet weak var imgH: UIImageView!
@IBOutlet weak var imgW: UIImageView!
@IBOutlet weak var imgV: UIImageView!
@IBOutlet weak var imgP: UIImageView!
@IBOutlet weak var textH: UILabel!
@IBOutlet weak var textW: UILabel!
@IBOutlet weak var textV: UILabel!
@IBOutlet weak var textP: UILabel!
    
    @IBOutlet weak var textH1: UILabel!
    @IBOutlet weak var textW1: UILabel!
    @IBOutlet weak var textV1: UILabel!
    @IBOutlet weak var textP1: UILabel!
    
    //@IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        view1.backgroundColor = UIColor(white: 1, alpha: 0.5)
        view1.layer.cornerRadius = 10
        text1.font = text1.font.withSize(25)
        text1.text = "81F"
        text2.text = "Clear"
        text3.text = "Los Angeles"
        textH.text = "Humidity"
        textW.text = "Wind Speed"
        textV.text = "Visibility"
        textP.text = "Pressure"
        textH1.text = "30 %"
        textW1.text = "3.65 mph"
        textV1.text = "9.94 mi"
        textP1.text = "29.85 inHg"
        img1.image = UIImage(named: "Clear.png")!
        imgH.image = UIImage(named: "Humidity.png")!
        imgW.image = UIImage(named: "WindSpeed.png")!
        imgV.image = UIImage(named: "Visibility.png")!
        imgP.image = UIImage(named: "Pressure.png")!
        
    searchBar.delegate = self
    dataFiltered = data

    dropButton.anchorView = searchBar
    dropButton.bottomOffset = CGPoint(x: 0, y:(dropButton.anchorView?.plainView.bounds.height)!)
    dropButton.backgroundColor = .white
    dropButton.direction = .bottom

    dropButton.selectionAction = { [unowned self] (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)") //Selected item: code at index: 0
    }
        
        
        
        
        
}

func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    dataFiltered = searchText.isEmpty ? data : data.filter({ (dat) -> Bool in
        dat.range(of: searchText, options: .caseInsensitive) != nil
    })
    print(searchText)
    dropButton.dataSource = dataFiltered
    dropButton.show()
}

func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.setShowsCancelButton(true, animated: true)
    for ob: UIView in ((searchBar.subviews[0] )).subviews {
        if let z = ob as? UIButton {
            let btn: UIButton = z
            btn.setTitleColor(UIColor.white, for: .normal)
        }
    }
}

func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = false
}

func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    searchBar.text = ""
    dataFiltered = data
    dropButton.hide()
}
    
    
    
    
    
    
    
    
}
