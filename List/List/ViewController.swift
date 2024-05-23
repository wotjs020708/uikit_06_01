//
//  ViewController.swift
//  List
//
//  Created by 어재선 on 5/22/24.
//

import UIKit

struct Animal {
    let name: String
}

struct Animalcategory {
    let catagory: String
    let animals: [Animal]
}

class ViewController: UIViewController, UITableViewDataSource {

    let categories = [
        Animalcategory(catagory: "포유륲", animals: [Animal(name: "고양이"), Animal(name: "강아지")]),
        Animalcategory(catagory: "파충류", animals: [Animal(name: "거북이"), Animal(name: "도마뱀")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //테이블 스타일 변경 가능 (생성자 함수예시)
        let tableview = UITableView(frame:  view.bounds, style: .insetGrouped)
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableview)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories[section].animals.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section].catagory
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        var config = cell.defaultContentConfiguration()
        config.text = categories[indexPath.section].animals[indexPath.row].name
        cell.contentConfiguration = config
        
        return cell
    }
    

}

