//
//  TripViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Игорь Пачкин on 25/1/24.
//

import UIKit

class TripViewController: UIViewController {

    let cities = [
        TripModel(image: "city1", name: "ABU DHABI"),
        TripModel(image: "city2", name: "SAN ANTONIO"),
        TripModel(image: "city1", name: "ABU DHABI")
    ]
    
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
    
    private lazy var searchView: UIView = {
        let searchView = UIView()
        searchView.backgroundColor = .white
        searchView.layer.cornerRadius = 5
        searchView.layer.borderWidth = 0.5
        searchView.layer.borderColor = UIColor(red: 0.762, green: 0.762, blue: 0.762, alpha: 1).cgColor
        searchView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        searchView.layer.shadowOpacity = 1
        searchView.layer.shadowRadius = 3
        searchView.layer.shadowOffset = CGSize(width: 0, height: 1)
        return searchView
        }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Куда хотите поехать?"
        textField.attributedPlaceholder = NSAttributedString(string: "Куда хотите поехать?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemBlue])
        return textField
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 250
        tableView.showsVerticalScrollIndicator = false
        tableView.register(TripTableViewCell.self, forCellReuseIdentifier: "travelCell")
        return tableView
    }()

        

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViewComponents()
    }
    
    @objc private func searchButtonTapped() {
        // Действия при нажатии на кнопку
    }

    func configureViewComponents(){
        view.addSubview(firstTitle)
        view.addSubview(secondTitle)
        view.addSubview(descriptionLabel)
        view.addSubview(searchView)
        searchView.addSubview(textField)
        searchView.addSubview(searchButton)
        view.addSubview(tableView)
        
        firstTitle.translatesAutoresizingMaskIntoConstraints = false
        secondTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        searchView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            firstTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            secondTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondTitle.topAnchor.constraint(equalTo: firstTitle.bottomAnchor, constant: 0),
            
            descriptionLabel.topAnchor.constraint(equalTo: secondTitle.bottomAnchor, constant: 11),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -43),
            
            searchView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            searchView.heightAnchor.constraint(equalToConstant: 40),
            
            textField.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 27),
            textField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: 0),
            
            searchButton.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -15),
            searchButton.widthAnchor.constraint(equalToConstant: 15),
            searchButton.heightAnchor.constraint(equalToConstant: 16.31),
            
            tableView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 27),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
    }
   

}

extension TripViewController: UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TripTableViewCell
        cell.configure(image: cities[indexPath.row].image, name: cities[indexPath.row].name)
        return cell
    }
    
    
}
