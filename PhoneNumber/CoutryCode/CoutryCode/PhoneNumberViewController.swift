//
//  PhoneNumberViewController.swift
//  CoutryCode
//
//  Created by Таня on 15.09.18.
//  Copyright © 2018 Mikhail. All rights reserved.
//

import UIKit
import PhoneNumberKit

class PhoneNumberViewController: UIViewController, ViewControllerDelegate {
    
    var code: CountryData?
    var phoneNumber = ""
    var countryName = ""
    var activityIndicator : UIActivityIndicatorView?
    @IBOutlet weak var countryLable: UILabel!
    @IBOutlet weak var codeLable: UILabel!
    @IBOutlet weak var phoneNumbField: PhoneNumberTextField!
    @IBAction func codeButton(_ sender: Any) {
          }
    @IBAction func searchButton(_ sender: Any) {
        
        self.phoneNumber = codeLable.text! + phoneNumbField.text!
        self.countryName = countryLable.text!
        performSegue(withIdentifier: "search", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
       self.navigationController?.isNavigationBarHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.destination is DataViewController
        {
            let viewController = segue.destination as! DataViewController
            viewController.delegate = self
        }
        else if segue.destination is ResultViewController {
            let vc = segue.destination as! ResultViewController
            vc.finalPnoneNumber = self.phoneNumber
            vc.finalCountryName = self.countryName
        }
    }
    func codeSelect(country: CountryData) {
        codeLable.text = country.dial_code
        countryLable.text = country.name
        code = country
    }
    
}


