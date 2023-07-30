//
//  FifthViewController.swift
//  HW9
//
//  Created by Justin Lee on 11/22/21.
//

import UIKit
import SVProgressHUD
import Highcharts

protocol FifthDelegate: class{
    func refresh()
}

class FifthViewController: UIViewController {
    
    

    
    var chartView: HIChartView!
    
    
    @IBOutlet weak var v1: UIView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var twitter: UIButton!
    
    /*(document.getElementById("tw")as HTMLAnchorElement).href = "https://twitter.com/intent/tweet?text="+a;*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        //super.viewDidLoad()
        super.viewWillAppear(animated)
        v1.backgroundColor = UIColor(white: 1, alpha: 0.5)
        v1.layer.cornerRadius = 10
        //let dat1 = SingletonClass.shared.requestForUser()
        //dat1.temperature = "7414"
        let dat = SingletonClass.shared.requestForUser()
        //print(dat.temperature)
        let ret = showWC(wc: dat.weatherCode)
        img1.image = UIImage(named: ret[0])!
        l1.text = ret[1]
        l2.text = dat.temperature+"\u{00B0}F"
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        // Do any additional setup after loading the view.
        chartView = HIChartView(frame: CGRect(x: 0, y: 0, width: 350, height: 300))
        let options = HIOptions()
        let chart = HIChart()
        chart.type = "arearange"
        options.chart = chart
        let series = HIArearange()
       
        let arr = [[0, toint(s: Float(dat.b0)!), toint(s: Float(dat.a0)!)],
                   [1, toint(s: Float(dat.b1)!), toint(s: Float(dat.a1)!)],
                   [2, toint(s: Float(dat.b2)!), toint(s: Float(dat.a2)!)],
                   [3, toint(s: Float(dat.b3)!), toint(s: Float(dat.a3)!)],
                   [4, toint(s: Float(dat.b4)!), toint(s: Float(dat.a4)!)],
                   [5, toint(s: Float(dat.b5)!), toint(s: Float(dat.a5)!)],
                   [6, toint(s: Float(dat.b6)!), toint(s: Float(dat.a6)!)],
                   [7, toint(s: Float(dat.b7)!), toint(s: Float(dat.a7)!)],
                   [8, toint(s: Float(dat.b8)!), toint(s: Float(dat.a8)!)],
                   [9, toint(s: Float(dat.b9)!), toint(s: Float(dat.a9)!)],
                   [10, toint(s: Float(dat.b10)!), toint(s: Float(dat.a10)!)],
                   [11, toint(s: Float(dat.b11)!), toint(s: Float(dat.a11)!)],
                   [12, toint(s: Float(dat.b12)!), toint(s: Float(dat.a12)!)],
                   [13, toint(s: Float(dat.b13)!), toint(s: Float(dat.a13)!)],
                   [14, toint(s: Float(dat.b14)!), toint(s: Float(dat.a14)!)]
                   ]
        series.data = arr
        
        series.lineColor = HIColor(rgb: 0, green: 0, blue: 0)
        series.name = "Temperature"
        
        
        series.fillColor = HIColor(linearGradient: ["x1": 0, "y1": 0, "x2": 1, "y2": 1], stops: [
            [0, "orange"],
            [1, "rgba(100,100,255,.25)"]
        ])//HIColor(rgba:139, green: 188, blue:33, alpha: 0.3)
        
        options.series = [series]
        let leg = HILegend()
        leg.enabled = 0
        options.legend = leg
        let tit = HITitle()
        tit.text = "Temperature Variation by Day"
        options.title = tit
        let tit2 = HITitle()
        tit2.text = "Temperature"
        
        let yaxis = HIYAxis()
        yaxis.title = tit2
        options.yAxis = [yaxis]
        
        options.legend.borderColor = HIColor(rgb: 0, green: 0, blue: 0)
        
        let xaxis = HIXAxis()
        //xaxis.type = "datetime"
        //xaxis.tickInterval = 1000 * 60 * 60 * 24
        options.xAxis = [xaxis]
        chartView.options = options
        chartView.tag = 99
        let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let tap = CGPoint(x: 195, y: 550)
        chartView.center = view.convert(tap, to: view2)
        view.addSubview(chartView)
    }
    
    func showWC(wc:String) -> Array<String>{
        var ret = ["0","0"]
        if(wc=="1000"){ret[0]="Clear.png";ret[1]="Clear";}
        else if(wc=="1100"){ret[0]="Mostly Clear.png";ret[1]="Mostly Clear";}
        else if(wc=="1101"){ret[0]="Partly Cloudy.png";ret[1]="Partly Cloudy";}
        else if(wc=="1102"){ret[0]="Mostly Cloudy.png";ret[1]="Mostly Cloudy";}
        else if(wc=="1001"){ret[0]="Cloudy.png";ret[1]="Cloudy";}
        else if(wc=="2000"){ret[0]="Fog.png";ret[1]="Fog";}
        else if(wc=="2100"){ret[0]="Light Fog.png";ret[1]="Light Fog";}
        else if(wc=="8000"){ret[0]="Thunderstorm.png";ret[1]="Thunderstorm";}
        else if(wc=="5001"){ret[0]="Flurries.png";ret[1]="Flurries";}
        else if(wc=="5100"){ret[0]="Light Snow.png";ret[1]="Light Snow";}
        else if(wc=="5000"){ret[0]="Snow.png";ret[1]="Snow";}
        else if(wc=="5101"){ret[0]="Heavy Snow.png";ret[1]="Heavy Snow";}
        else if(wc=="7102"){ret[0]="Light Ice Pellets.png";ret[1]="Light Ice Pellets";}
        else if(wc=="7000"){ret[0]="Ice Pellets.png";ret[1]="Ice Pellets";}
        else if(wc=="7101"){ret[0]="Heavy Ice Pellets.png";ret[1]="Heavy Ice Pellets";}
        else if(wc=="4000"){ret[0]="Drizzle.png";ret[1]="Drizzle";}
        else if(wc=="6000"){ret[0]="Freezing Drizzle.png";ret[1]="Freezing Drizzle";}
        else if(wc=="6200"){ret[0]="Light Freezing Rain.png";ret[1]="Light Freezing Rain";}
        else if(wc=="6001"){ret[0]="Freezing Rain.png";ret[1]="Freezing Rain";}
        else if(wc=="6201"){ret[0]="Heavy Freezing Rain.png";ret[1]="Heavy Freezing Rain";}
        else if(wc=="4200"){ret[0]="Light Rain.png";ret[1]="Light Rain";}
        else if(wc=="4001"){ret[0]="Rain.png";ret[1]="Rain";}
        else if(wc=="4201"){ret[0]="Heavy Rain.png";ret[1]="Heavy Rain";}
        return ret;
      }
    
    func removespace(s:String) -> String{
        let ss = s.replacingOccurrences(of: " ", with: "%20")
        return ss
    }
    
    @IBAction func tweet(_ sender: UIButton) {
        let dat = SingletonClass.shared.requestForUser()
        let ret = showWC(wc: dat.weatherCode)
        let t1 = removespace(s: dat.fname)
        let temp = "https://twitter.com/intent/tweet?text=The%20current%20temperature%20at%20\(t1)%20is%20\(dat.temperature)F.%20The%20weather%20condition%20are%20\(ret[1])%20%23CSCI571WeatherSearch"
        
        if let url = URL(string: temp) {
            print("haha")
            UIApplication.shared.open(url)
        }
    }
    
    func toint(s: Float) -> Float{
        var t2 = s
        t2 = t2.rounded(.down)
        return t2
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
