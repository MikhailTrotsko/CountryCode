//
//  DataViewController.swift
//  PhoneNumberApp
//
//  Created by Таня on 14.09.18.
//  Copyright © 2018 Mikhail. All rights reserved.
//
import SVProgressHUD
import UIKit

protocol ViewControllerDelegate: AnyObject {
    func codeSelect (country: CountryData)
}

class DataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public weak var delegate: ViewControllerDelegate?
    var countrys = [CountryData]()
    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
    super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        SVProgressHUD.show()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        DispatchQueue.global(qos: .userInitiated).async {
        }
        request()
    }
    @objc func update() {
        SVProgressHUD.dismiss()
    }
    func request() {
        
        let url = URL(string: "https://raw.githubusercontent.com/isaac-weisberg/idsi-ios-development-test-task/master/com.idsiapps.whodatboi.dataset.countries.json")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{if error == nil{
                self.countrys = try JSONDecoder().decode([CountryData].self, from: data!)
                
                for mainarr in self.countrys{
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    print(mainarr.name,mainarr.dial_code)
            }
        }
    }
            catch {
                print("Error in get json data")
            }
        }
            .resume()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countrys.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemViewCell
        _ = self.countrys[indexPath.row]
        cell.nameLable.text = self.countrys[indexPath.row].name
        cell.codeLable.text = self.countrys[indexPath.row].dial_code
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countrys = self.countrys[indexPath.row]
        self.navigationController?.popViewController(animated: true)
        self.delegate?.codeSelect(country: countrys)
    }
    
}




