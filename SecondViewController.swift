//
//  SecondViewController.swift
//  HW9
//
//  Created by Justin Lee on 11/19/21.
//

import UIKit
import SVProgressHUD
import Highcharts

class SecondViewController: UIViewController {
    //let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.searchController = searchController
        self.view.backgroundColor = UIColor.red
        //let url1 = "https://bonguleetomorrow.wl.r.appspot.com/test1/34.023,-118.2851"
        //getData1(from: url1)
        //print("XXXXXX")
        // Do any additional setup after loading the view.
        
    }
    
    /*private func getData1(from url: String){
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
        })
            
        task.resume()
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

  /*

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
    //let uvIndex: Float
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
*/
