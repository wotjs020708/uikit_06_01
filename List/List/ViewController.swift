//
//  ViewController.swift
//  List
//
//  Created by 어재선 on 5/22/24.
//

import UIKit

struct Animal {
    let name: String
    let image: UIImage
}


class ViewController: UIViewController, UITableViewDataSource {
    

    let animals = [
    Animal(name: "고양이", image: UIImage(systemName: "cat")!),
    Animal(name: "강아지", image: UIImage(systemName: "dog")!),
    Animal(name: "토끼", image: UIImage(systemName: "hare")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableview = UITableView(frame: view.bounds)
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableview)
    }
    
    // MARK: - UITableVeiwDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = animals[indexPath.row].name
        config.image = animals[indexPath.row].image
        cell.contentConfiguration = config
        
        
        return cell
    }
}

