//
//  ViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Игорь Пачкин on 24/1/24.
//

import UIKit

class BookViewController: UIViewController {

    let topics = [
        Model(title: "SOS", description: "Mini meltdown? Get some Headspace in a hurry", image: "Book", isLeft: true),
        Model(title: "On-the-Go", description: "Mindful living? Get your Headspace to go", image: "Bookshelf", isLeft: false),
        Model(title: "Classic", description: "Like it simple? Get some extra Headspace", image: "Diploma", isLeft: true),
        Model(title: "SOS", description: "Mini meltdown? Get some Headspace in a hurry", image: "Globus", isLeft: false)
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 174
        tableView.register(BookCustomTableViewCell.self, forCellReuseIdentifier: "bookCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViewComponents()
        navigationItem.title = "Singles"
        let leftButton = UIBarButtonItem(image: UIImage(named: "Fourline")?.withTintColor(.black), style: .plain, target: self, action: #selector(buttonTapped))
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(image: UIImage(named: "Magnifyingglass"), style: .plain, target: self, action: #selector(buttonTapped))
        navigationItem.rightBarButtonItem = rightButton

        
    }
    
    @objc func buttonTapped(){
        
    }
    
    func configureViewComponents(){
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

}

extension BookViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookCustomTableViewCell
        let temp = topics[indexPath.row]
        cell.configureCellViews(title: temp.title, description: temp.description, image: temp.image, isLeft: temp.isLeft)
        return cell
    }
}
