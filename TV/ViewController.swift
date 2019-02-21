//
//  ViewController.swift
//  TV
//
//  Created by Michael Linker on 2/19/19.
//  Copyright © 2019 Michael Linker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    var items: [Item] = []
    var tmpname = ""
    var tmpdescription = " "
    override func viewDidLoad() {
        super.viewDidLoad()
    myTableView.dataSource = self
        items.append(item1)
        items.append(item2)
    }
    @objc func sendtext() {
        
    }
    var item1 = Item(Name: "milk", Note: "Before ours goes sour")
    var item2 = Item(Name: "Eggs", Note: "get two dozen")
    @IBAction func AddItem(_ sender: Any) {
        var TEMPITEM = Item(Name: tmpname, Note: tmpdescription)
        let alert = UIAlertController.init(title: "New Item", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Enter Name Of Item"
        })
        alert.addTextField { (TextField) in
            TextField.placeholder = "Optional Note"
        }
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak alert] (_) in
            let textFieldName = alert?.textFields![0].text
            let textFieldNote = alert?.textFields![1]
            if let tmpname = textFieldName {
            TEMPITEM.name = tmpname
                if let tmpnote = textFieldNote?.text {
            TEMPITEM.optionalNote = tmpnote
                }
            }
            self.items.append(TEMPITEM)
            self.myTableView.reloadData()
        }))
        present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyCell")!
        if items.count > indexPath.row {
        cell.textLabel?.text = items[indexPath.row].name
        cell.detailTextLabel?.text = items[indexPath.row].optionalNote
        }else {
            cell.textLabel?.text = ""
            cell.detailTextLabel?.text = ""

        }
        return cell
    }

}

