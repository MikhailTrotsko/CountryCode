//
//  ResultViewController.swift
//  CoutryCode
//
//  Created by Таня on 15.09.18.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var finalPnoneNumber = ""
    var finalCountryName = ""
    @IBAction func continueButton(_ sender: Any) {
    }
    @IBOutlet weak var finalLable: UILabel!
    @IBOutlet weak var finalPhoneLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        finalLable.text = finalCountryName
        finalPhoneLable.text = finalPnoneNumber
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
