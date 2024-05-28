//
//  NextViewController.swift
//  NavigationController
//
//  Created by 어재선 on 5/23/24.
//

import UIKit

protocol NextViewControllerDelegate {
    func save(animal: Animal)
}

class NextViewController: UIViewController {

    var animal: Animal?
    var delegate: NextViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "다음 화면"

        let label = UILabel()
        label.text = animal?.name ?? "-"
   
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let button = UIButton(type: .custom)
        button.configuration = UIButton.Configuration.filled()
        button.setTitle("전달", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction{ [weak self] _ in
            if let delegate = self?.delegate {
                delegate.save(animal: Animal(name: "강아지"))
                self?.navigationController?.popViewController(animated: true)
            }
        }, for: .touchUpInside)
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10)
        ])
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
