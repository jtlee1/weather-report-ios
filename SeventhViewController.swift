//
//  SeventhViewController.swift
//  HW9
//
//  Created by Justin Lee on 11/23/21.
//

import UIKit

class SeventhViewController: UIViewController {

    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v5: UIView!
    @IBOutlet weak var v6: UIView!
    @IBOutlet weak var v7: UIView!
    @IBOutlet weak var v8: UIView!
    @IBOutlet weak var v9: UIView!
    
    @IBOutlet weak var i1: UIImageView!
    @IBOutlet weak var i2: UIImageView!
    @IBOutlet weak var i3: UIImageView!
    @IBOutlet weak var i4: UIImageView!
    @IBOutlet weak var i5: UIImageView!
    @IBOutlet weak var i6: UIImageView!
    @IBOutlet weak var i7: UIImageView!
    @IBOutlet weak var i8: UIImageView!
    @IBOutlet weak var i9: UIImageView!
    
    @IBOutlet weak var l11: UILabel!
    @IBOutlet weak var l12: UILabel!
    @IBOutlet weak var l21: UILabel!
    @IBOutlet weak var l22: UILabel!
    @IBOutlet weak var l31: UILabel!
    @IBOutlet weak var l32: UILabel!
    @IBOutlet weak var l41: UILabel!
    @IBOutlet weak var l42: UILabel!
    @IBOutlet weak var l51: UILabel!
    
    @IBOutlet weak var l61: UILabel!
    @IBOutlet weak var l62: UILabel!
    @IBOutlet weak var l71: UILabel!
    @IBOutlet weak var l72: UILabel!
    @IBOutlet weak var l81: UILabel!
    @IBOutlet weak var l82: UILabel!
    @IBOutlet weak var l91: UILabel!
    @IBOutlet weak var l92: UILabel!
    @IBOutlet weak var twitter: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        //super.viewDidLoad()
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor(white: 1, alpha: 0.0)
        
        let dat = SingletonClass.shared.requestForUser()
        let ret = showWC(wc: dat.weatherCode)
        //self.navigationItem.title = dat.fname
        
        v1.backgroundColor = UIColor(white: 1, alpha: 0.5)
        v2.backgroundColor = UIColor(white: 1, alpha: 0.5)
        v3.backgroundColor = UIColor(white: 1, alpha: 0.5)
        v4.backgroundColor = UIColor(white: 1, alpha: 0.5)
        v5.backgroundColor = UIColor(white: 1, alpha: 0.5)
        v6.backgroundColor = UIColor(white: 1, alpha: 0.5)
        v7.backgroundColor = UIColor(white: 1, alpha: 0.5)
        v8.backgroundColor = UIColor(white: 1, alpha: 0.5)
        v9.backgroundColor = UIColor(white: 1, alpha: 0.5)
        v1.layer.cornerRadius = 10
        v2.layer.cornerRadius = 10
        v3.layer.cornerRadius = 10
        v4.layer.cornerRadius = 10
        v5.layer.cornerRadius = 10
        v6.layer.cornerRadius = 10
        v7.layer.cornerRadius = 10
        v8.layer.cornerRadius = 10
        v9.layer.cornerRadius = 10
        i1.image = UIImage(named: "WindSpeed.png")!
        i2.image = UIImage(named: "Pressure.png")!
        i3.image = UIImage(named: "Precipitation.png")!
        i4.image = UIImage(named: "Temperature.png")!
        i5.image = UIImage(named: ret[0])!
        i6.image = UIImage(named: "Humidity.png")!
        i7.image = UIImage(named: "Visibility.png")!
        i8.image = UIImage(named: "CloudCover.png")!
        i9.image = UIImage(named: "UVIndex.png")!
        l11.text = dat.windSpeed+"mph"
        l12.text = "Wind Speed"
        l21.text = dat.pressureSeaLevel+"inHg"
        l22.text = "Pressure"
        l31.text = dat.precipitationProbability+"%"
        l32.text = "Precipitation"
        l41.text = dat.temperature+"\u{00B0}F"
        l42.text = "Temperature"
        l51.text = ret[1]
        
        l61.text = dat.humidity+"%"
        l62.text = "Humidity"
        l71.text = dat.visibility+"mi"
        l72.text = "Visibility"
        l81.text = dat.cloudCover+"%"
        l82.text = "Cloud Cover"
        l91.text = dat.uvIndex
        l92.text = "UVIndex"
        
        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
