//
//  ViewController.swift
//  fibtest
//
//  Created by LonestarX on 12/05/2018.
//  Copyright © 2018 LNX. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableViewArray = NSMutableArray()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showMagicAlert()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showMagicAlert() {
        let magicAlert = UIAlertController(title: "The first how many numbers?", message: nil, preferredStyle: .alert)
        magicAlert.addTextField()
        let enterAction = UIAlertAction(title: "Go", style: .default) { (action) -> Void in
            if let fibCount = Int(magicAlert.textFields![0].text!) {
                self.getFibonacciNumbers(n: fibCount)
            }
            else {
                print("h4xxor detected. reported to FBI.")
            }
        }
        magicAlert.addAction(enterAction)
        present(magicAlert, animated: true)
    }
    
    func getFibonacciNumbers(n: Int) {
        var n1 = 0
        var n2 = 1
        for _ in 2...n {
            let number = n1 + n2
            n1 = n2
            n2 = number
            tableViewArray.add(n2)
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let fibNumber = tableViewArray[indexPath.row]
        cell.textLabel?.text = String(describing: fibNumber)
        return cell
    }
    
}

