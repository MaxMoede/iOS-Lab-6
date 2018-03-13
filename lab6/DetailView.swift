//
//  DetailView.swift
//  lab6
//
//  Created by Max Moede on 2/11/18.
//  Copyright © 2018 Max Moede. All rights reserved.
//

import UIKit

class DetailView: UIViewController {

    var conditions : String?
    var high : String?
    var low : String?
    var aveWindDir : String?
    var aveWindSpeed : String?
    var maxWindDir : String?
    var maxWindSpeed : String?
    var date : String?
    var anImage : UIImage?
    @IBOutlet weak var conditionsL: UILabel!
    @IBOutlet weak var dateL: UILabel!
    @IBOutlet weak var highL: UILabel!
    @IBOutlet weak var lowL: UILabel!
    @IBOutlet weak var avgDirL: UILabel!
    @IBOutlet weak var avgSpeedL: UILabel!
    @IBOutlet weak var maxDirL: UILabel!
    @IBOutlet weak var maxSpeedL: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        conditionsL.text = conditions
        dateL.text = date
        highL.text = high
        lowL.text = low
        avgDirL.text = aveWindDir
        avgSpeedL.text = aveWindSpeed
        maxDirL.text = maxWindDir
        maxSpeedL.text = maxWindSpeed
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
