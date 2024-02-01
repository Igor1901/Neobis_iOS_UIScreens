//
//  CryptoViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Игорь Пачкин on 31/1/24.
//

import UIKit

class CryptoViewController: UIViewController {
    
    let crypto = [
        CryptoModel(name: "Bitcoin", image: "bitcoin", percentage: "+1,6%", money: "$29,850.15" , coins: "2.73 BTC", color: "#F6543E"),
        CryptoModel(name: "Ethereum", image: "eth", percentage: "-0,82%", money: "$10,561.24 ", coins: "47.61 ETH", color: "#6374C3"),
        CryptoModel(name: "Litecoin", image: "t", percentage: "-2,10%", money: "$3,676.76 ", coins: "39,27 LTC", color: "#30E0A1"),
        CryptoModel(name: "Ripple", image: "xrp", percentage: "+0,27%", money: "$5,241.62 ", coins: "16447,65 XRP", color: "#638FFE"),
        CryptoModel(name: "Ripple", image: "xrp", percentage: "+0,27%", money: "$5,241.62 ", coins: "16447,65 XRP", color: "#638FFE"),
        CryptoModel(name: "Ripple", image: "xrp", percentage: "+0,27%", money: "$5,241.62 ", coins: "16447,65 XRP", color: "#638FFE"),
    ]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Портфолио"
        label.font = UIFont(name: "Segoe UI Bold", size: 32) // Устанавливаем желаемый шрифт и размер
        label.textColor = .black
        return label
    }()
    
    private lazy var checkAllLabel: UILabel = {
        let label = UILabel()
        label.text = "посмотреть все"
        label.font = UIFont(name: "Segoe UI", size: 14)
        label.textColor = UIColor(hex: "#F6543E")
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 88
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: "cryptoCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Создание пустого пространства слева от элемента
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = 42 // Установка желаемого отступа
        
        // Создание UIBarButtonItem с пользовательским видом (UILabel)
        let customTitleView = UIBarButtonItem(customView: titleLabel)
        
        // Устанавливаем UIBarButtonItem с пользовательским видом как левый элемент навигационного бара
        navigationItem.leftBarButtonItems = [fixedSpace, customTitleView]
        
        // Включаем большой заголовок для навигационного контроллера
        navigationController?.navigationBar.prefersLargeTitles = true
        let rightButton = UIBarButtonItem(image: UIImage(named: "cryptoSettings"), style: .plain, target: self, action: #selector(buttonTapped))
        navigationItem.rightBarButtonItem = rightButton
        
        setupConstraints()
    }
    
    @objc func buttonTapped(){
        
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        view.addSubview(checkAllLabel)
        
        checkAllLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkAllLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 108),
            checkAllLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            tableView.topAnchor.constraint(equalTo: checkAllLabel.bottomAnchor, constant: 25),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
}

    extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return crypto.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CryptoTableViewCell
            let temp = crypto[indexPath.row]
            cell.configure(color: temp.color, image: temp.image, name: temp.name, percentage: temp.percentage, money: temp.money, coins: temp.coins)
            return cell
        }
    
        
    
}
