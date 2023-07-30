//
//  ThirdViewController.swift
//  HW9
//
//  Created by Justin Lee on 11/21/21.
//

import UIKit
import DropDown
import Toast_Swift
import SwiftSpinner


class ThirdViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    //let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    var ispress = 0
    var ispage = 0
        // cell reuse id (cells that scroll out of view can be reused)
    //let cellReuseIdentifier = "cell"
    var itemp = ""
    var imgwc:[String] = ["0","1","2","3","4","5","6","7"]
    var srt:[String] = ["0","1","2","3","4","5","6","7"]
    var sst:[String] = ["0","1","2","3","4","5","6","7"]
var data: [String] = []
    var sixthVC = SixthViewController()

var dataFiltered: [String] = []
var dropButton = DropDown()
   
    @IBOutlet weak var lastbut: UIButton!
    @IBOutlet weak var lastview: UIView!
    weak var pageProtocol: PageProtocol?
    @IBOutlet weak var test: UIButton!
    var bf:Bool = true
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var twt: UIButton!
    @IBOutlet weak var ltit: UILabel!
    
    
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
    
    //@IBOutlet weak var tit1: UILabel!
    @IBOutlet weak var textH1: UILabel!
    @IBOutlet weak var textW1: UILabel!
    @IBOutlet weak var textV1: UILabel!
    @IBOutlet weak var textP1: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var name = "here"
    var secname = "num"
    var animals: [String] = ["0","1","2","3","4","5","6","7"]
    var location = ""
        // cell reuse id (cells that scroll out of view can be reused)
        let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
    super.viewDidLoad()
        var backB = UIBarButtonItem()
        backB.title = "Weather"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backB
        

        let url0 = "https://ipinfo.io/?token=9fbd2aa40f882a"
        var url00 = "https://maps.googleapis.com/maps/api/geocode/json?address="+name+"&key=AIzaSyBX_ooZpOoPOunEfN0AcQjEsp3NWeD53rE"
        //let url1 = "https://bonguleetomorrow.wl.r.appspot.com/test1/34.023,-118.2851"
        if (ispress==0 && ispage==0){
            SwiftSpinner.show(duration: 4.0, title: "Loading...")
            ltit.isHidden = true
            twt.isHidden = true
            test.isHidden = true
            getData0(from: url0)
        }
        else if(ispress==1){
            //self.tit1.text = name
            SwiftSpinner.show(duration: 4.0, title: "Fetching Weather Details for \(name)...")
            print("ispress")
            searchBar.isHidden = true
            url00 = removespace(s: url00)
            self.text3.text = name
            self.ltit.text = name
            print(url00)
            
            getData2(from: url00)
        }
        else{
            print("ispage")
            print(self.ispage)
            print(self.ispress)
            test.setImage(UIImage(named: "close-circle.png"), for: .normal)
            ltit.isHidden = true
            twt.isHidden = true
            self.text3.text = name
            url00 = removespace(s: url00)
            getData2(from: url00)
        }
        //let url1 = "https://maps.googleapis.com/maps/api/geocode/json?address=los&key=AIzaSyBX_ooZpOoPOunEfN0AcQjEsp3NWeD53rE"
        //let url1 = "https://bonguleetomorrow.wl.r.appspot.com/cor/los"
        //print(url1)
        //getData3(from: url1)
        createDate()
        //let dat = SingletonClass.shared.requestForUser()
        
        searchBar.searchTextField.backgroundColor = .white
        searchBar.backgroundImage = UIImage()
        
        view1.backgroundColor = UIColor(white: 1, alpha: 0.5)
        view1.layer.cornerRadius = 10
        tableView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        tableView.layer.cornerRadius = 10
        text1.font = text1.font.withSize(25)
        //text1.text = "nope"
        //text2.text = "Clear"
        //text3.text = "Los Angeles"
        textH.text = "Humidity"
        textW.text = "Wind Speed"
        textV.text = "Visibility"
        textP.text = "Pressure"
        //textH1.text = "30 %"
        //textW1.text = "3.65 mph"
        //textV1.text = "9.94 mi"
        //textP1.text = "29.85 inHg"
        //img1.image = UIImage(named: "Mostly Clear.png")!
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
        print("Selected item: \(item) at index: \(index)")
        itemp = item
        searchBar.text = ""
        
        
        
        self.pageProtocol?.pushpage(name: item)
        let dat = SingletonClass.shared.requestForUser()
        dat.fname = item
        //Selected item: code at index: 0
    }
        
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
                
                // (optional) include this line if you want to remove the extra empty cell divider lines
                // self.tableView.tableFooterView = UIView()

                // This view controller itself will provide the delegate methods and row data for the table view.
                tableView.delegate = self
                tableView.dataSource = self
        
    }
    
    private func getData0(from url: String){
        let task = URLSession.shared.dataTask(with: URL(string:url)!, completionHandler: {data, response, error in
                
            guard let data = data, error == nil else{
                print("something went wrong")
                return
            }
            var result: Initial2?
            do{
                result = try JSONDecoder().decode(Initial2.self, from: data)
            }
            catch{
                print("YYY")
                print(String(describing: error))
            }
            
            guard let json = result else{
                return
            }
            DispatchQueue.main.async { [self] in
                let dat = SingletonClass.shared.requestForUser()
            let url1 = "https://bonguleetomorrow.wl.r.appspot.com/test1/"+json.loc
            print(url1)
            self.text3.text = json.city
            dat.fname = json.city
            self.getData1(from: url1)
            }
            //self.location = json.loc
            //print(json.loc)
            /*DispatchQueue.main.async { [self] in
                
                self.tableView.reloadData()
            }*/
            
        })
            
        task.resume()
    }
    
    
    
    private func getData1(from url: String){
        let task = URLSession.shared.dataTask(with: URL(string:url)!, completionHandler: {data, response, error in
                
            guard let data = data, error == nil else{
                print("something went wrong")
                return
            }
            var result: Initial?
            do{
                result = try JSONDecoder().decode(Initial.self, from: data)
            }
            catch{
                print("YYY")
                print(String(describing: error))
            }
            
            guard let json = result else{
                return
            }
            
            print(json.data.timelines[0].intervals[0].values.temperatureMin)
            DispatchQueue.main.async { [self] in
                let dat = SingletonClass.shared.requestForUser()
                //dat.fname = String(json.data.timelines[0].intervals[0].values.temperatureMin)
                dat.startTime = ""
                dat.pressureSeaLevel = String(json.data.timelines[0].intervals[0].values.pressureSeaLevel)
                dat.cloudCover = String(json.data.timelines[0].intervals[0].values.cloudCover)
                dat.temperature = String(json.data.timelines[0].intervals[0].values.temperature)
                dat.temperatureMax = String(json.data.timelines[0].intervals[0].values.temperatureMax)
                dat.temperatureMin = String(json.data.timelines[0].intervals[0].values.temperatureMin)
                dat.weatherCode = String(Int(json.data.timelines[0].intervals[0].values.weatherCode))
                dat.windDirection = String(json.data.timelines[0].intervals[0].values.windDirection)
                dat.windSpeed = String(json.data.timelines[0].intervals[0].values.windSpeed)
                dat.precipitationProbability = String(json.data.timelines[0].intervals[0].values.precipitationProbability)
                dat.precipitationType = String(json.data.timelines[0].intervals[0].values.precipitationType)
                dat.humidity = String(json.data.timelines[0].intervals[0].values.humidity)
                dat.visibility = String(json.data.timelines[0].intervals[0].values.visibility)
                dat.sunriseTime = String(json.data.timelines[0].intervals[0].values.sunriseTime)
                dat.sunsetTime = String(json.data.timelines[0].intervals[0].values.sunsetTime)
                dat.uvIndex = String(json.data.timelines[0].intervals[0].values.uvIndex!)
                dat.a0 = String(json.data.timelines[0].intervals[0].values.temperatureMax)
                dat.a1 = String(json.data.timelines[0].intervals[1].values.temperatureMax)
                dat.a2 = String(json.data.timelines[0].intervals[2].values.temperatureMax)
                dat.a3 = String(json.data.timelines[0].intervals[3].values.temperatureMax)
                dat.a4 = String(json.data.timelines[0].intervals[4].values.temperatureMax)
                dat.a5 = String(json.data.timelines[0].intervals[5].values.temperatureMax)
                dat.a6 = String(json.data.timelines[0].intervals[6].values.temperatureMax)
                dat.a7 = String(json.data.timelines[0].intervals[7].values.temperatureMax)
                dat.a8 = String(json.data.timelines[0].intervals[8].values.temperatureMax)
                dat.a9 = String(json.data.timelines[0].intervals[9].values.temperatureMax)
                dat.a10 = String(json.data.timelines[0].intervals[10].values.temperatureMax)
                dat.a11 = String(json.data.timelines[0].intervals[11].values.temperatureMax)
                dat.a12 = String(json.data.timelines[0].intervals[12].values.temperatureMax)
                dat.a13 = String(json.data.timelines[0].intervals[13].values.temperatureMax)
                dat.a14 = String(json.data.timelines[0].intervals[14].values.temperatureMax)
                dat.b0 = String(json.data.timelines[0].intervals[0].values.temperatureMin)
                dat.b1 = String(json.data.timelines[0].intervals[1].values.temperatureMin)
                dat.b2 = String(json.data.timelines[0].intervals[2].values.temperatureMin)
                dat.b3 = String(json.data.timelines[0].intervals[3].values.temperatureMin)
                dat.b4 = String(json.data.timelines[0].intervals[4].values.temperatureMin)
                dat.b5 = String(json.data.timelines[0].intervals[5].values.temperatureMin)
                dat.b6 = String(json.data.timelines[0].intervals[6].values.temperatureMin)
                dat.b7 = String(json.data.timelines[0].intervals[7].values.temperatureMin)
                dat.b8 = String(json.data.timelines[0].intervals[8].values.temperatureMin)
                dat.b9 = String(json.data.timelines[0].intervals[9].values.temperatureMin)
                dat.b10 = String(json.data.timelines[0].intervals[10].values.temperatureMin)
                dat.b11 = String(json.data.timelines[0].intervals[11].values.temperatureMin)
                dat.b12 = String(json.data.timelines[0].intervals[12].values.temperatureMin)
                dat.b13 = String(json.data.timelines[0].intervals[13].values.temperatureMin)
                dat.b14 = String(json.data.timelines[0].intervals[14].values.temperatureMin)
                
                self.text1.text = String(json.data.timelines[0].intervals[0].values.temperature)+" \u{00B0}F"
                self.textH1.text = String(json.data.timelines[0].intervals[0].values.humidity)+" %"
                self.textW1.text = String(json.data.timelines[0].intervals[0].values.windSpeed) + " mph"
                self.textV1.text = String(json.data.timelines[0].intervals[0].values.visibility)+" mi"
                self.textP1.text = String(json.data.timelines[0].intervals[0].values.pressureSeaLevel)+" inHg"
                self.setWC(wc2:String(Int(json.data.timelines[0].intervals[0].values.weatherCode)))
                for x in imgwc{
                    let y = Int(x)
                    self.imgwc[y!] = String(Int(json.data.timelines[0].intervals[y!].values.weatherCode))
                    let srtt1 = String(json.data.timelines[0].intervals[y!].values.sunriseTime)
                    let srtt2 = srtt1.components(separatedBy: "T")
                    let srtt3 = srtt2[1].components(separatedBy: ":")
                    let srtt4 = srtt3[0]+":"+srtt3[1]
                    self.srt[y!] = srtt4
                    let sstt1 = String(json.data.timelines[0].intervals[y!].values.sunsetTime)
                    let sstt2 = sstt1.components(separatedBy: "T")
                    let sstt3 = sstt2[1].components(separatedBy: ":")
                    let sstt4 = sstt3[0]+":"+sstt3[1]
                    self.sst[y!] = sstt4
                }
                self.tableView.reloadData()
            }
            
        })
            
        task.resume()
    }
    
    private func getData2(from url: String){
        let task = URLSession.shared.dataTask(with: URL(string:url)!, completionHandler: {data, response, error in
                
            guard let data = data, error == nil else{
                print("something went wrong")
                return
            }
            var result: Initial3?
            do{
                result = try JSONDecoder().decode(Initial3.self, from: data)
            }
            catch{
                print("YYY")
                print(String(describing: error))
            }
            
            guard let json = result else{
                return
            }
            
            //print("test")
            //print(json.results[0].geometry.location.lat)
            let url1 = "https://bonguleetomorrow.wl.r.appspot.com/test1/"+String(json.results[0].geometry.location.lat)+","+String(json.results[0].geometry.location.lng)
            print(url1)
            self.getData1(from: url1)
            //self.location = json.loc
            //print(json.loc)
            /*DispatchQueue.main.async { [self] in
                
                self.tableView.reloadData()
            }*/
            
        })
            
        task.resume()
    }
    
    private func getData3(from url: String){
        let task = URLSession.shared.dataTask(with: URL(string:url)!, completionHandler: {data, response, error in
                
            guard let data = data, error == nil else{
                print("something went wrong")
                return
            }
            var result: Initial4?
            do{
                result = try JSONDecoder().decode(Initial4.self, from: data)
            }
            catch{
                print("YYY")
                print(String(describing: error))
            }
            
            guard let json = result else{
                return
            }
            
            print("test")
            //let city = json.predictions[0].description.components(separatedBy: ",")
            var j = 0;
            self.data = []
            while(json.predictions.count>j){
                //var myda = json.predictions[j].description
                let city = json.predictions[j].description.components(separatedBy: ",")
                self.data.append(city[0])
                //print(city[0])
                j = j+1;
            }
            //self.location = json.loc
            //print(json.loc)
            /*DispatchQueue.main.async { [self] in
                
                self.tableView.reloadData()
            }*/
            
        })
            
        task.resume()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if(!bf){
            print("!bf")
            print(name)
            self.pageProtocol?.createpage(name: name)
        }
    }
    
    
    @IBAction func testbut(_ sender: UIButton) {
        if(ispress==1){
        if(bf){
            //self.pageProtocol?.createpage(name: itemp)
            self.view.makeToast(name+" was added to the Favorite List")
            test.setImage(UIImage(named: "close-circle.png"), for: .normal)
        }
        else{
            self.view.makeToast(name+" was removed to the Favorite List")
            test.setImage(UIImage(named: "plus-circle.png"), for: .normal)
        }
        bf = !bf
        }
        else{
            self.pageProtocol?.deletepage()
        }
    }
    
    
    
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    dataFiltered = searchText.isEmpty ? data : data.filter({ (dat) -> Bool in
        dat.range(of: searchText, options: .caseInsensitive) != nil
    })
    let url1 = "https://bonguleetomorrow.wl.r.appspot.com/cor/" + searchText
    print(searchText)
    self.getData3(from: url1)
    //self.data = ["ahahaha"]
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.animals.count
        }
        
        // create a cell for each table view row
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            // create a new cell if needed or reuse an old one
            let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)! as UITableViewCell
            
            // set the text from the data model
            let fullString = NSMutableAttributedString(string: self.animals[indexPath.row])
            let imga1 = NSTextAttachment()
            
            //let dat = SingletonClass.shared.requestForUser()
            //let ret = showWC(wc:dat.weatherCode)
            let ret = showWC(wc:imgwc[indexPath.row])
            
            //print("YYY")
            
            imga1.image = UIImage(named: ret[0])
            imga1.bounds = CGRect(x: 0,y: 0,width: 30,height: 30)
            let imgs1 = NSAttributedString(attachment: imga1)
            fullString.append(imgs1)
            fullString.append(NSAttributedString(string: self.srt[indexPath.row]))
            
            let imga2 = NSTextAttachment()
            imga2.image = UIImage(named: "sun-rise")
            imga2.bounds = CGRect(x: 0,y: 0,width: 30,height: 30)
            let imgs2 = NSAttributedString(attachment: imga2)
            fullString.append(imgs2)
            
            fullString.append(NSAttributedString(string: self.sst[indexPath.row]))
            
            let imga3 = NSTextAttachment()
            imga3.image = UIImage(named: "sun-set")
            imga3.bounds = CGRect(x: 0,y: 0,width: 30,height: 30)
            let imgs3 = NSAttributedString(attachment: imga3)
            fullString.append(imgs3)
            
            cell.textLabel?.attributedText = (fullString)
            //cell.textLabel?.text = (fullString)
            //cell.imageView!.image = UIImage(named: "Clear.png")!
            cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
            cell.selectionStyle = .none
            return cell
        }
        
        // method to run when table view cell is tapped
        /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You tapped cell number \(indexPath.row).")
        }*/
   
    func createDate(){
        for x in animals{
        let y = Int(x)!
        let PST = TimeZone(abbreviation: "PST")!
        let now = Calendar.current.dateComponents(in: PST, from: Date())
            let today = DateComponents(year: now.year, month: now.month, day: (now.day)!+y)
        let dateToday = Calendar.current.date(from: today)!
        let df = DateFormatter()
        df.dateFormat = "MM-dd-yyyy"
        let dateString = df.string(from: dateToday)
        self.animals[y] = String(dateString)
        }
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
    
    func setWC(wc2:String){
        //let dat = SingletonClass.shared.requestForUser()
        //self.navigationItem.title = dat.fname
        let ret = showWC(wc: wc2)
        //print("XXXX")
        //print(wc2)
        text2.text = ret[1]
        img1.image = UIImage(named: ret[0])!
        
    }
    func removespace(s:String) -> String{
        let ss = s.replacingOccurrences(of: " ", with: "")
        return ss
    }
    func setWC2(wc2:String,x:Int){
        
        
        let ret = showWC(wc: wc2)
        
    }
    
    @IBAction func pushtab(_ sender: UIButton) {
        pageProtocol?.createtab()
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

struct Initial4: Codable{
    let predictions: [Predictions]
}

struct Predictions: Codable{
    let description: String
}


struct Initial3: Codable{
    let results: [Results]
}

struct Results: Codable{
    let geometry: Geometry
}

struct Geometry: Codable{
    let location:Location
}

struct Location: Codable{
    let lat: Float
    let lng: Float
}



struct Initial2: Codable{
    let loc: String
    let city: String
}


struct Initial: Codable{
    let data: Timeline
}
struct Timeline: Codable{
    let timelines: [Time]
}
struct Time: Codable{
    let timestep: String
    let startTime: String
    let endTime: String
    let intervals: [Intervals]
}
struct Intervals: Codable{
    let startTime: String
    let values: Values
}
struct Values: Codable{
    let pressureSeaLevel: Float
    let cloudCover: Float
    let uvIndex: Float?
    let temperature: Float
    let temperatureMax: Float
    let temperatureMin: Float
    let weatherCode: Float
    let windDirection: Float
    let windSpeed: Float
    let precipitationProbability: Float
    let precipitationType: Float
    let humidity: Float
    let visibility: Float
    let sunriseTime: String
    let sunsetTime: String
}
