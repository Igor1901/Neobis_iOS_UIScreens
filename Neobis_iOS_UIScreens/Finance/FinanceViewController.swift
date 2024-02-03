//
//  FinanceViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Игорь Пачкин on 2/2/24.
//

import UIKit

class FinanceViewController: UIViewController {

    let finance = [
        FinanceModel(name1: "Дом", image: "home", color: "#FFC328", cost: "$321", name2: "Продукты"),
        FinanceModel(name1: "Покупки", image: "tag", color: "#3C009E", cost: "$574", name2: "Одежда"),
        FinanceModel(name1: "Транспорт", image: "smile", color: "#9CC741", cost: "$124", name2: "Такси"),
        FinanceModel(name1: "Здоровье", image: "heart", color: "#C141CC", cost: "$765", name2: "Лечение"),
        FinanceModel(name1: "Фитнес", image: "cookie", color: "#1F86FF", cost: "$324", name2: "Тренировки"),
        FinanceModel(name1: "Счета", image: "mail", color: "#21C0E3", cost: "$726", name2: "Комунальные"),
        FinanceModel(name1: "Ресторан", image: "heart", color: "#C141CC", cost: "$325", name2: "Ужин"),
    ]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Баланс"
        label.font = UIFont(name: "Inter-Medium", size: 16)
        return label
    }()
    
    let moneyLabel: UILabel = {
        let label = UILabel()
        label.text = "$1200.89"
        label.font = UIFont(name: "Inter-ExtraBold", size: 36)
        return label
    }()
    
    let date: UILabel = {
        let label = UILabel()
        label.text = "Апрель 2020"
        label.font = UIFont(name: "Inter-Regular", size: 18)
        return label
    }()
    
    let leftArrow: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "chevron.left"))
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let rightArrow: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "chevron.right"))
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let viewTable: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 31
        return view
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        //tableView.delegate = self
        //tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.register(FinanceTableViewCell.self, forCellReuseIdentifier: "financeCell")
        return tableView
    }()
    
    let etcLabel: UILabel = {
        let label = UILabel()
        label.text = "См. ещё"
        label.font = UIFont(name: "Inter-Regular", size: 16)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#FAFAFA")
        tableView.delegate = self
        tableView.dataSource = self
        setupConstraints()
    }
    func setupConstraints(){
        view.addSubview(titleLabel)
        view.addSubview(moneyLabel)
        view.addSubview(date)
        view.addSubview(leftArrow)
        view.addSubview(rightArrow)
        view.addSubview(viewTable)
        viewTable.addSubview(tableView)
        viewTable.addSubview(etcLabel)
        
        [titleLabel, moneyLabel, date, leftArrow, rightArrow, viewTable, tableView, etcLabel].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            moneyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            moneyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            date.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 29),
            date.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            leftArrow.heightAnchor.constraint(equalToConstant: 15),
            leftArrow.widthAnchor.constraint(equalToConstant: 15),
            leftArrow.centerYAnchor.constraint(equalTo: date.centerYAnchor),
            leftArrow.trailingAnchor.constraint(equalTo: date.leadingAnchor, constant: -44),
            
            rightArrow.heightAnchor.constraint(equalToConstant: 15),
            rightArrow.widthAnchor.constraint(equalToConstant: 15),
            rightArrow.centerYAnchor.constraint(equalTo: date.centerYAnchor),
            rightArrow.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 44),
            
            viewTable.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 28),
            viewTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14),
            
            tableView.topAnchor.constraint(equalTo: viewTable.topAnchor, constant: 18),
            tableView.leadingAnchor.constraint(equalTo: viewTable.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: viewTable.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: etcLabel.topAnchor, constant: 30),
            
            etcLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            etcLabel.topAnchor.constraint(equalTo: viewTable.bottomAnchor, constant: -33)
        ])
        
    }

}

extension FinanceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "financeCell", for: indexPath) as! FinanceTableViewCell
        let temp = finance[indexPath.row]
        cell.configure(color: temp.color, image: temp.image, name1: temp.name1, cost: temp.cost, name2: temp.name2)
        return cell
    }
    //configure(color: String, image:String, name1: String, cost: String, name2: String)
    
}

