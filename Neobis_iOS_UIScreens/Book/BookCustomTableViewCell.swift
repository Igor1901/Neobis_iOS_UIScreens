//
//  BookCustomTableViewCell.swift
//  Neobis_iOS_UIScreens
//
//  Created by Игорь Пачкин on 25/1/24.
//

import UIKit

class BookCustomTableViewCell: UITableViewCell {

    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Segoe UI", size: 30)
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Segoe UI", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
        }()
    
    var cellImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var arrowRight: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Union"))
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellViews()
    }
    
    func setupCellViews(){
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        contentView.addSubview(cellImage)
        contentView.addSubview(arrowRight)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        arrowRight.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arrowRight.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowRight.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
            ])
    }
    
    func configureCellViews(title: String, description: String, image: String, isLeft: Bool){
        titleLabel.text = title
        descriptionLabel.text = description
        cellImage.image = UIImage(named: image)
        
        
       
       
        
        if isLeft {
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
                stackView.trailingAnchor.constraint(equalTo: cellImage.leadingAnchor, constant: -24),
                
                cellImage.centerYAnchor.constraint(equalTo: centerYAnchor),
                cellImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -47),
                cellImage.widthAnchor.constraint(equalToConstant: 92),
                cellImage.heightAnchor.constraint(equalToConstant: 92),
                
                
            ])
        } else {
            NSLayoutConstraint.activate([
                cellImage.centerYAnchor.constraint(equalTo: centerYAnchor),
                cellImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
                cellImage.widthAnchor.constraint(equalToConstant: 92),
                cellImage.heightAnchor.constraint(equalToConstant: 92),

                
                stackView.topAnchor.constraint(equalTo: topAnchor, constant: 26),
                stackView.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 35),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            ])
        }
            

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
