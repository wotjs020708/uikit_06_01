//
//  ViewController.swift
//  Form
//
//  Created by 어재선 on 5/23/24.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource {
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let formOnelabel = UILabel()
    let formOneTextField = UITextField()
    let formTwoLabel = UILabel()
    let formTwoTextField = UITextField()
    let resultLabelOne = UILabel()
    let resultLabelTwo = UILabel()
    lazy var textFieldAction = UIAction(handler: textFieldDidChange)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
       
    }
    
    // MARK: UITableViewDateSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
        return cell
    }
    
    
    // 액션 개체 생성 / 삭제 코드 추가
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        formOneTextField.addAction(textFieldAction, for: .editingChanged)
        formTwoTextField.addAction(textFieldAction, for: .editingChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        formOneTextField.removeAction(textFieldAction, for: .editingChanged)
        formTwoTextField.removeAction(textFieldAction, for: .editingChanged)
    }
    
    func setupFormOne() {
        formOnelabel.text = "이것은 첫 번째 폼입니다"
        formOnelabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formOnelabel)
        
        formOneTextField.borderStyle = .roundedRect
        formOneTextField.placeholder = "여기에 입력하세요"
        formOneTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formOneTextField)
        
        
        NSLayoutConstraint.activate([
            formOnelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            formOnelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            formOneTextField.topAnchor.constraint(equalTo: formOnelabel.bottomAnchor, constant: 10),
            formOneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            formOneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
    }
    
    func setupFormTwo() {
        formTwoLabel.text = "이것은 두번째 폼입니다."
        formTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formTwoLabel)
        
        formTwoTextField.borderStyle = .roundedRect
        formTwoTextField.placeholder = "여기에 입력하세요"
        formTwoTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formTwoTextField)
        
        NSLayoutConstraint.activate([
            formTwoLabel.topAnchor.constraint(equalTo: formOneTextField.bottomAnchor, constant: 20),
            formTwoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            formTwoTextField.topAnchor.constraint(equalTo: formTwoLabel.bottomAnchor, constant: 10),
            formTwoTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            formTwoTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
    }
    
    func setupResults() {
        resultLabelOne.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabelOne)
        
        resultLabelTwo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabelTwo)
        
        NSLayoutConstraint.activate([
            resultLabelOne.topAnchor.constraint(equalTo: formTwoTextField.bottomAnchor, constant: 20),
            resultLabelOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabelTwo.topAnchor.constraint(equalTo: resultLabelOne.bottomAnchor, constant: 10),
            resultLabelTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
    }
    
    func textFieldDidChange(_ action: UIAction) {
        guard let textField = action.sender as? UITextField else { return }
        
        if textField == formOneTextField {
            resultLabelOne.text = "폼 #1 = \(formOneTextField.text ?? "" )"
        } else {
            resultLabelTwo.text = "폼 #2 = \(formTwoTextField.text ?? "")"
        }
    }
    
    //    @objc func textFieldDidChange(_ textField: UITextField) {
    //        if textField == formOneTextField {
    //            resultLabelOne.text = "폼 #1 = \(formOneTextField.text ?? "" )"
    //        } else {
    //            resultLabelTwo.text = "폼 #2 = \(formTwoTextField.text ?? "")"
    //        }
    //    }
    
}

