//
//  ViewController.swift
//  Form
//
//  Created by 어재선 on 5/23/24.
//

import UIKit



class ViewController: UIViewController {

    let formOnelabel = UILabel()
    let formOneTextField = UITextField()
    let formTwoLabel = UILabel()
    let formTwoTextField = UITextField()
    let resultLabelOne = UILabel()
    let resultLabelTwo = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupFormOne()
        setupFormTwo()
        setupResults()
        
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

}

