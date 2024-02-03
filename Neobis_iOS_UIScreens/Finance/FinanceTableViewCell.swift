//
//  FinanceTableViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by Игорь Пачкин on 2/2/24.
//

import UIKit

class FinanceTableViewCell: UITableViewCell {

    private lazy var circleView: UIView = {
        let circleView = UIView()
        circleView.clipsToBounds = true
        circleView.layer.cornerRadius = 15
        return circleView
    }()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Medium", size: 16)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var costLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-ExtraBold", size: 14)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.textAlignment = .center
        label.textColor = .lightGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupConstraints()
    }
    
    func setupConstraints() {
        contentView.addSubview(circleView)
        contentView.addSubview(logoImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(costLabel)
        contentView.addSubview(descriptionLabel)
        
        [circleView, logoImage, titleLabel, costLabel, descriptionLabel].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            circleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            circleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circleView.heightAnchor.constraint(equalToConstant: 30),
            circleView.widthAnchor.constraint(equalToConstant: 30),
            
            logoImage.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 15),
            logoImage.widthAnchor.constraint(equalToConstant: 15),
            
            titleLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 24),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            costLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            costLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 2)
        ])
    }
    
    func configure(color: String, image:String, name1: String, cost: String, name2: String) {
        circleView.backgroundColor = UIColor(hex: color, alpha: 1)
        logoImage.image = UIImage(named: image)
        titleLabel.text = name1
        costLabel.text = cost
        descriptionLabel.text = name2
    }
    //FinanceModel(name1: "Дом", image: "home", color: "#FFC328", cost: "$321", name2: "Продукты"),
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
