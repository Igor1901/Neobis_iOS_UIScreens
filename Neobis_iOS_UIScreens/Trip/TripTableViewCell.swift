//
//  TripTableViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by Игорь Пачкин on 31/1/24.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 24)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var lineImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "redLine"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var cityImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var darkness: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dark")
        image.layer.cornerRadius = 10
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 14, left: 0, bottom: 14, right: 0))
    }
    
    func setupConstraints(){
        contentView.addSubview(cityImage)
        contentView.addSubview(darkness)
        contentView.addSubview(titleLabel)
        contentView.addSubview(lineImage)
        
        cityImage.translatesAutoresizingMaskIntoConstraints = false
        darkness.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        lineImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cityImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cityImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cityImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            darkness.topAnchor.constraint(equalTo: contentView.topAnchor),
            darkness.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            darkness.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            darkness.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 38),
            
            lineImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            lineImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            lineImage.heightAnchor.constraint(equalToConstant: 1),
            lineImage.widthAnchor.constraint(equalToConstant: 136),
        ])
    }
    
    func configure(image: String, name: String) {
        titleLabel.text = name
        cityImage.image = UIImage(named: image)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   

}
