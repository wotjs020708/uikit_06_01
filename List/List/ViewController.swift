//
//  ViewController.swift
//  List
//
//  Created by 어재선 on 5/22/24.
//

import UIKit

class CustomCell: UITableViewCell {
    let animalimageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        animalimageView.contentMode = .scaleAspectFit
        animalimageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(animalimageView)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            animalimageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  16),
            animalimageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            animalimageView.widthAnchor.constraint(equalToConstant: 50),
            animalimageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: animalimageView.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

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
        tableview.register(CustomCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableview)
    }
    
    // MARK: - UITableVeiwDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
//        var config = cell.defaultContentConfiguration()
//        config.text = animals[indexPath.row].name
//        config.image = animals[indexPath.row].image
//        cell.contentConfiguration = config
        cell.animalimageView.image = animals[indexPath.row].image
        cell.nameLabel.text = animals[indexPath.row].name
        return cell
    }
}

