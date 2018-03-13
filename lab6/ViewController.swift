//
//  ViewController.swift
//  lab6
//
//  Created by Max Moede on 2/8/18.
//  Copyright © 2018 Max Moede. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    // MARK: - Table view data source
    
    let api10DayForecast = "https://api.wunderground.com/api/926cefd1e8fa1ae7/forecast10day/q/CA/San_Luis_Obispo.json"
    @IBOutlet weak var myTable: UITableView!
    
    var txtForecast : weatherClass?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (txtForecast?.forecastDays.count) ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 85.0;//Choose your custom row height
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moreWeather", for: indexPath) as! weatherCell
        
        let forecastDay = txtForecast!.forecastDays[indexPath.row]
        
        // Configure the cell...
        cell.dateLabel?.text = "\(String(describing: forecastDay.period))   \(forecastDay.dateVal.monthname_short) \(forecastDay.dateVal.day) ,\(forecastDay.dateVal.year)"
        cell.conditions?.text = "\(forecastDay.conditions)"
        cell.avgDir?.text = "\(String(forecastDay.aveWindVal.dir))"
        cell.avgSpeed?.text = "\(String(forecastDay.aveWindVal.mph))"
        cell.maxDir?.text = "\(String(forecastDay.maxWindVal.dir))"
        cell.maxSpeed?.text = "\(String(forecastDay.maxWindVal.mph))"
        cell.lowL?.text = "\(String(forecastDay.low.fahrenheit))"
        cell.highL?.text = "\(String(forecastDay.high.fahrenheit))"
        
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let request = URLRequest(url: URL(string: api10DayForecast)!)
        
        let task: URLSessionDataTask = session.dataTask(with: request)
        { (receivedData, response, error) -> Void in
            
            if let data = receivedData {
                do {
                    let decoder = JSONDecoder()
                    let txtForecastService = try decoder.decode(textForecastService.self, from: data)
                    
                    self.txtForecast = txtForecastService.forecast.simpleforecast
                    
                    DispatchQueue.main.async {
                        self.myTable.reloadData()
                    }
                    
                } catch {
                    print("Exception on Decode: \(error)")
                }
            }
        }
        task.resume()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showConditions" {
            if let indexPath = self.myTable.indexPathForSelectedRow {
                let myCell = self.myTable.cellForRow(at: indexPath) as! weatherCell
                (segue.destination as! DetailView).conditions = myCell.conditions.text
                (segue.destination as! DetailView).high = myCell.highL.text
                (segue.destination as! DetailView).low = myCell.lowL.text
                (segue.destination as! DetailView).date = myCell.dateLabel.text
                (segue.destination as! DetailView).aveWindSpeed = myCell.avgSpeed.text
                (segue.destination as! DetailView).aveWindDir = myCell.avgDir.text
                (segue.destination as! DetailView).maxWindSpeed = myCell.maxSpeed.text
                (segue.destination as! DetailView).maxWindDir = myCell.maxDir.text
                let forecastDay = txtForecast!.forecastDays[indexPath.row]
                DispatchQueue.global(qos: .userInitiated).async {
                    let url = URL(string: forecastDay.iconUrl)
                    let responseData = try? Data(contentsOf: url!)
                    let downloadedImage = UIImage(data: responseData!)
                    DispatchQueue.main.async {
                        let myWidth = downloadedImage?.size.width
                        let myHeight = downloadedImage?.size.height
                        (segue.destination as! DetailView).myImage.frame = CGRect(x: 20, y: 20, width: myWidth!, height: myHeight!)
                        (segue.destination as! DetailView).myImage.image = downloadedImage
                        
                    }
                }
            }
        }
    }
    
    
}


