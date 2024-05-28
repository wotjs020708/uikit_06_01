//
//  CustomCell.swift
//  Todo
//
//  Created by 어재선 on 5/24/24.
//

import UIKit

class CustomCell: UITableViewCell {

    let checkBoxView = UIImageView()
    let nameLabel = UILabel()
    
    var isCheck  = Bool()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    
    func setup() {
        checkBoxView.contentMode = .scaleAspectFit
        checkBoxView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(checkBoxView)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            checkBoxView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -15),
            checkBoxView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkBoxView.widthAnchor.constraint(equalToConstant: 20),
            checkBoxView.heightAnchor.constraint(equalToConstant: 20),
            
            
        ])
    }
    
    func configure(item: Todo) {
        checkBoxView.image = item.image
        nameLabel.text = item.name
    }
}

