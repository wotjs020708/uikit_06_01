//
//  ViewController.swift
//  Todo
//
//  Created by 어재선 on 5/24/24.
//

import UIKit


class TodoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let todos = [
        Todo(name: "123", image: UIImage(systemName: "checkmark")!,isCheck: false),
        Todo(name: "아리갓도",image: UIImage(systemName: "checkmark")!, isCheck: false),
        Todo(name: "이거징", image: UIImage(systemName: "checkmark")!, isCheck: false)
    ]
    var tabelView: UITableView = {
        let tableview = UITableView()
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.dataSource = self
        tabelView.delegate = self
        tabelView.register(CustomCell.self, forCellReuseIdentifier: "todoCell")
        
        setup()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTodo))
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! CustomCell
        let todo: Todo = todos[indexPath.row]
        cell.configure(item: todo)
        return cell
    }

    func setup() {
        
        tabelView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabelView)
        NSLayoutConstraint.activate([
            tabelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tabelView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tabelView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tabelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    //func
    
    @objc private func addTodo() {
        guard let sheet = self.sheetPresentationController else { return }
        let navController = UIViewController()
        navController.modalPresentationStyle = .pageSheet
        
        sheet.animateChanges {
            sheet.selectedDetentIdentifier = .medium
        }
    }

}

