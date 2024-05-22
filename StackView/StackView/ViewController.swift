//
//  ViewController.swift
//  StackView
//
//  Created by 어재선 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    let slider = UISlider()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "값: 0.5"
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.5
        slider.isContinuous = true
        slider.addAction(UIAction{ [weak self] _ in
            self?.label.text = "값 \(String(format: "%.1f", self?.slider.value ?? 0))"
            
        }, for: .valueChanged)
        
        let stackVaiew = UIStackView(arrangedSubviews: [label, slider])
        stackVaiew.axis = .vertical
        stackVaiew.spacing = 10
        stackVaiew.alignment = .fill
        
        view.addSubview(stackVaiew)
        
        stackVaiew.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackVaiew.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackVaiew.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackVaiew.widthAnchor.constraint(equalToConstant: 200)
        ])
        
     
    }


}

