//
//  ViewController.swift
//  iWeather
//
//  Created by iOS Student on 2/15/17.
//  Copyright © 2017 NKT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var background: UIImageView!

    @IBOutlet weak var lbl_city: UILabel!
    
    @IBOutlet weak var lbl_quote: UILabel!
    
    @IBOutlet weak var lbl_temp: UILabel!
    @IBAction func btn_cf(_ sender: AnyObject) {
        let tempnow = Double(lbl_temp.text!)
        if lbl_cf.text == "C"
        {
            let tempafter = tempnow! * 1.8 + 32
            lbl_temp.text = String(tempafter)
            lbl_cf.text = "F"
        }
        else
        {
            let tempafter = tempnow! / 1.8 - 32
            lbl_temp.text = String(tempafter)
            lbl_cf.text = "C"
        }
    }
    
    @IBOutlet weak var lbl_cf: UILabel!
    var quotes = ["Có chí thì chuẩn men",
        "Cây có cội, nước có nguồn",
        "Có công mài sắt, có ngày nên kim",
        "Cái răng, cái tóc là gốc con người",
        "Cái kim trong bọc cũng có ngày lòi ra",
        "Con trâu là đầu cơ nghiệp",
        "Cái khó ló cái khôn",
        "Cần cù bù thông minh"]
    var citys = ["Hà Nội","Hồ Chí Minh","Đà Nẵng","Vĩnh Phúc","Hà Tây"]
    var backgrounds = ["Blood","Sun","Moon"]
    var cfcf = ["C","F"]
    
    @IBAction func btn_random(_ sender: AnyObject) {
        
        let cityIndex = Int(arc4random_uniform(UInt32(citys.count)))
        lbl_city.text = citys[cityIndex]
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        lbl_quote.text = quotes[quoteIndex]

        let imageIndex = Int(arc4random_uniform(UInt32(backgrounds.count)))
        background.image = UIImage.init(named: backgrounds[imageIndex])
        
        getTemp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getTemp() -> Void {
        
        let randomNumber = String(format: "%2.1f" , tempRandom())
        lbl_temp.text = randomNumber
    }
    func tempRandom() -> Double {
        return Double(arc4random_uniform(18)+14) + Double(arc4random()) / Double(INT32_MAX)
    }


}

