//
//  TripViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Игорь Пачкин on 25/1/24.
//

import UIKit

class TripViewController: UIViewController {

    var firstTitle: UILabel = {
        let label = UILabel()
        label.text = "Путешествуйте"
        label.font = UIFont(name: "NotoSans-Medium", size: 24)
        return label
    }()
    
    var secondTitle: UILabel = {
        let label = UILabel()
        label.text = "Почувствуйте прилив энергии"
        label.font = UIFont(name: "NotoSans-Medium", size: 24)
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let desc = UILabel()
        desc.text = "Мы поможем вам исследовать, сравнить и забронировать впечатления - все в одном месте."
        desc.numberOfLines = 0
        desc.textAlignment = .center
        desc.font = UIFont(name: "NotoSans-Regular", size: 14)
        return desc
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViewComponents()
    }
    

    func configureViewComponents(){
        view.addSubview(firstTitle)
        view.addSubview(secondTitle)
        view.addSubview(descriptionLabel)
        
        firstTitle.translatesAutoresizingMaskIntoConstraints = false
        secondTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            firstTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            firstTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            secondTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondTitle.topAnchor.constraint(equalTo: firstTitle.bottomAnchor, constant: 0),
            
            descriptionLabel.topAnchor.constraint(equalTo: secondTitle.bottomAnchor, constant: 11),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -43),
            
            ])
    }
   

}
