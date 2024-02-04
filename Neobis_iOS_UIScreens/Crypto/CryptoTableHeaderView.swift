//
//  CryptoTableHeaderView.swift
//  Neobis_iOS_UIScreens
//
//  Created by Игорь Пачкин on 3/2/24.
//

import UIKit

class CryptoTableHeaderView: UITableViewHeaderFooterView {
     let checkAllLabel: UILabel = {
        let label = UILabel()
        label.text = "посмотреть все"
        label.font = UIFont(name: "Segoe UI", size: 14)
        label.textColor = UIColor(hex: "#F6543E")
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(checkAllLabel)
        
        checkAllLabel.translatesAutoresizingMaskIntoConstraints = false
        checkAllLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        checkAllLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        checkAllLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }

}
