//
//  temp.swift
//  HW9
//
//  Created by Justin Lee on 11/19/21.
//

//
//  ViewController.swift
//  HW9
//
//  Created by Justin Lee on 11/19/21.
//

/*import UIKit
import SVProgressHUD
import Highcharts

class ViewController: UINavigationController {

    var chartView: HIChartView!
    var secondVC = SecondViewController()
    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        // Do any additional setup after loading the view.
        createButton()
        chartView = HIChartView(frame: CGRect(x: view.bounds.origin.x, y: view.bounds.origin.y  +  20, width: view.bounds.size.width, height: 300))
        let options = HIOptions()
        let chart = HIChart()
        chart.type = "arearange"
        options.chart = chart
        let series = HIArearange()
        series.data = [[1246406400000, 14.3, 27.7],
                       [1246492800000, 14.5, 27.8],
                       [1246579200000, 15.5, 29.6],
                       [1246665600000, 16.7, 30.7],
                       [1246752000000, 16.5, 25.0],
                       [1246838400000, 17.8, 25.7],
                       [1246924800000, 13.5, 24.8],
                       [1247011200000, 10.5, 21.4],
                       [1247097600000, 9.2, 23.8],
                       [1247184000000, 11.6, 21.8],
                       [1247270400000, 10.7, 23.7],
                       [1247356800000, 11.0, 23.3],
                       [1247443200000, 11.6, 23.7],
                       [1247529600000, 11.8, 20.7],
                       [1247616000000, 12.6, 22.4],
                       [1247702400000, 13.6, 19.6],
                       [1247788800000, 11.4, 22.6],
                       [1247875200000, 13.2, 25.0],
                       [1247961600000, 14.2, 21.6],
                       [1248048000000, 13.1, 17.1],
                       [1248134400000, 12.2, 15.5],
                       [1248220800000, 12.0, 20.8],
                       [1248307200000, 12.0, 17.1],
                       [1248393600000, 12.7, 18.3],
                       [1248480000000, 12.4, 19.4],
                       [1248566400000, 12.6, 19.9],
                       [1248652800000, 11.9, 20.2],
                       [1248739200000, 11.0, 19.3],
                       [1248825600000, 10.8, 17.8],
                       [1248912000000, 11.8, 18.5],
                       [1248998400000, 10.8, 16.1]]
        options.series = [series]
        let xaxis = HIXAxis()
        xaxis.type = "datetime"
        //xaxis.tickInterval = 1000 * 60 * 60 * 24
        options.xAxis = [xaxis]
        chartView.options = options
        chartView.tag = 99
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let tap = CGPoint(x: 195, y: 650)
        chartView.center = view.convert(tap, to: view2)
        view.addSubview(chartView)

        
        
        navigationItem.searchController = searchController
        //SVProgressHUD.show()
        //SVProgressHUD.setDefaultMaskType(.black)
        //SVProgressHUD.show(withStatus: "YAY")
    }
    
    
    
    
    
    func createButton(){
        var butt=UIButton(frame: CGRect(x:0,y:0,width:200,height:50))
        butt.center = view.center
        butt.configuration = .myButton1()
        butt.tag = 100
        butt.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        view.addSubview(butt)
    }
    //@objc
    //@IBAction
    @IBAction func buttonTapped(sender : UIButton) {
        pushViewController(secondVC, animated: true)
        if let viewWithTag = self.view.viewWithTag(99) {
               viewWithTag.removeFromSuperview()
           }else{
               print("No!")
           }
        if let viewWithTag = self.view.viewWithTag(100) {
               viewWithTag.removeFromSuperview()
           }else{
               print("No!")
           }
    }
}

extension UIButton.Configuration{
 static func myButton1()->UIButton.Configuration{
     var config: UIButton.Configuration = .filled()
     config.title = "Tap Me!"
     config.subtitle = "subtitle"
     config.titleAlignment = .center
     config.cornerStyle = .medium
     config.showsActivityIndicator = true
     return config
 }
    
}
*/

