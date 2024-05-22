//
//  ViewController.swift
//  List
//
//  Created by 어재선 on 5/22/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let items = ["고양이", "강아지", "새", " 파출류", "물고기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableview = UITableView(frame:  view.bounds)
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableview)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        var config = cell.defaultContentConfiguration()
        config.text = items[indexPath.row]
        cell.contentConfiguration = config
        
        return cell
    }
    

}

