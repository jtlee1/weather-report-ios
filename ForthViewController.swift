//
//  ForthViewController.swift
//  HW9
//
//  Created by Justin Lee on 11/21/21.
//

import Highcharts
import UIKit

class ForthViewController: UIViewController {

    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var i1: UIImageView!
    @IBOutlet weak var i2: UIImageView!
    @IBOutlet weak var i3: UIImageView!
    
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var twitter: UIButton!
    
    
    override func viewDidLoad() {
        
      super.viewDidLoad()
    }
    
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    //super.viewDidLoad()
      
      v1.backgroundColor = UIColor(white: 1, alpha: 0.5)
      v1.layer.cornerRadius = 10
      
      
      let dat = SingletonClass.shared.requestForUser()
      let ret = showWC(wc: dat.weatherCode)
      
      i1.image = UIImage(named: "Precipitation.png")!
      i2.image = UIImage(named: "Humidity.png")!
      i3.image = UIImage(named: "CloudCover.png")!
      l1.text = "Precipitation: " + dat.precipitationProbability + "%"
      l2.text = "Humidity: "+dat.humidity+"%"
      l3.text = "Cloud Cover: "+dat.cloudCover+"%"
      
    //let chartView = HIChartView(frame: view.bounds)
    let chartView = HIChartView(frame: CGRect(x: 20, y: 400, width: 350, height: 350))
    chartView.plugins = ["solid-gauge"]

    let options = HIOptions()

    let chart = HIChart()
    chart.type = "solidgauge"
    chart.height = "90%"
    options.chart = chart

    let title = HITitle()
    title.text = "Weather Data"
    title.style = HICSSObject()
    title.style.fontSize = "24px"
    options.title = title

    let tooltip = HITooltip()
    tooltip.borderWidth = 0
    tooltip.shadow = HIShadowOptionsObject()
    tooltip.shadow.opacity = 0
    tooltip.style = HICSSObject()
    tooltip.style.fontSize = "14px"
    tooltip.valueSuffix = "%"
    tooltip.pointFormat = "{series.name}<br><span style=\"font-size:1.5em; color: {point.color}; font-weight: bold\">{point.y}</span>"
    tooltip.positioner = HIFunction(jsFunction: "function (labelWidth) { return { x: (this.chart.chartWidth - labelWidth) / 2, y: (this.chart.plotHeight / 2) + 15 }; }")
    options.tooltip = tooltip

    let pane = HIPane()
    pane.startAngle = 0
    pane.endAngle = 360

    let background1 = HIBackground()
    background1.backgroundColor = HIColor(rgba: 130, green: 238, blue: 106, alpha: 0.35)//HIColor(rgba: 106, green: 165, blue: 231, alpha: 0.35)
    background1.outerRadius = "117%"
    background1.innerRadius = "98%"
    background1.borderWidth = 0

    let background2 = HIBackground()
    background2.backgroundColor = HIColor(rgba: 106, green: 165, blue: 231, alpha: 0.35)//HIColor(rgba: 51, green: 52, blue: 56, alpha: 0.35)
    background2.outerRadius = "97%"
    background2.innerRadius = "77%"
    background2.borderWidth = 0

    let background3 = HIBackground()
      background3.backgroundColor = HIColor(rgba: 238, green: 106, blue: 130, alpha: 0.35)
    background3.outerRadius = "77%"
    background3.innerRadius = "58%"
    background3.borderWidth = 0

    pane.background = [
      background1, background2, background3
    ]

    options.pane = pane

    let yAxis = HIYAxis()
    yAxis.min = 0
    yAxis.max = 100
    yAxis.lineWidth = 0
    yAxis.tickPosition = ""
    options.yAxis = [yAxis]

    let plotOptions = HIPlotOptions()
    plotOptions.solidgauge = HISolidgauge()
    let dataLabels = HIDataLabels()
    dataLabels.enabled = false
    plotOptions.solidgauge.dataLabels = [dataLabels]
    plotOptions.solidgauge.linecap = "round"
    plotOptions.solidgauge.stickyTracking = false
    plotOptions.solidgauge.rounded = true
    options.plotOptions = plotOptions

    let move = HISolidgauge()
    move.name = "Cloud Cover"
    let moveData = HIData()
    moveData.color = HIColor(rgba: 130, green: 238, blue: 106, alpha: 1)//HIColor(rgba: 106, green: 165, blue: 231, alpha: 1)
    moveData.radius = "117%"
    moveData.innerRadius = "98%"
      var t1 = Float(dat.cloudCover)!
      t1 = t1.rounded(.down)
    moveData.y = NSNumber(value: t1)
    move.data = [moveData]

    let exercise = HISolidgauge()
    exercise.name = "Precipitation"
    let exerciseData = HIData()
    exerciseData.color = HIColor(rgba: 106, green: 165, blue: 231, alpha: 1)//HIColor(rgba: 51, green: 52, blue: 56, alpha: 1)
    exerciseData.radius = "97%"
    exerciseData.innerRadius = "77%"
      var t2 = Float(dat.precipitationProbability)!
      t2 = t2.rounded(.down)
      exerciseData.y = NSNumber(value: t2)
    exercise.data = [exerciseData]

    let stand = HISolidgauge()
    stand.name = "Humidity"
    let standData = HIData()
    standData.color = HIColor(rgba: 238, green: 106, blue: 130, alpha: 1)
    standData.radius = "77%"
    standData.innerRadius = "58%"
      var t3 = Float(dat.humidity)!
      t3 = t3.rounded(.down)
      standData.y = NSNumber(value: t3)
    stand.data = [standData]

    options.series = [move, exercise, stand]

    chartView.options = options

    self.view.addSubview(chartView)
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

}
