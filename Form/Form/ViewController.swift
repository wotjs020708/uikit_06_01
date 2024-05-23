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
    lazy var textFieldAction = UIAction(handler: textFieldDidChange)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupFormOne()
        setupFormTwo()
        setupResults()
        
        //        formOneTextField.addAction(UIAction{ [weak self] _ in
        //            self?.resultLabelOne.text = "폼 #1 = \(self?.formOneTextField.text ?? "" )"
        //        }, for: .editingChanged)
        //
        //        formTwoTextField.addAction(UIAction{ [weak self] _ in
        //            self?.resultLabelTwo.text = "폼 #2 = \(self?.formTwoTextField.text ?? "")"
        //        }, for: .editingChanged)
        //        formOneTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        //        formTwoTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        formOneTextField.addAction(UIAction(handler: textFieldDidChange), for: .editingChanged)
        formTwoTextField.addAction(UIAction(handler: textFieldDidChange), for: .editingChanged)
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

