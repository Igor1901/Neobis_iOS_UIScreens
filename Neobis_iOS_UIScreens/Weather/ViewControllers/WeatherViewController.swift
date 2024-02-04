//
//  WeatherViewController.swift
//  Neobis_iOS_UIScreens
//
//  Created by Игорь Пачкин on 3/2/24.
//

import UIKit

class WeatherViewController: UIViewController {

    let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        return gradient
    }()
    
    let line1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "line1")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let line2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "line2")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let pointImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "map")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let сityLabel: UILabel = {
        let label = UILabel()
        label.text = "Бишкек"
        label.textColor = .white
        label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.addSmallShadow()
        return label
    }()
    
    let downArrow: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrowDown")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let cityView: UIView = UIView()

    let notificationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "notification")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let sunImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sun")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#FFFFFF", alpha: 0.3)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 20
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Сегодня, 26 Апрель"
        label.textColor = .white
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.addSmallShadow()
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "22°"
        label.addBigShadow()
        label.font = UIFont(name: "Overpass-Regular", size: 100)
        label.textColor = .white
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.font = UIFont(name: "Overpass-Bold", size: 24)
        label.addSmallShadow()
        label.textColor = .white
        return label
    }()
    
    let infoView: UIView = UIView()
    
    let windImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "wind")
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        return image
    }()
    
    let rainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rain")
        image.contentMode = .scaleAspectFill
        image.tintColor = .white
        return image
    }()
    
    
    let windLabel: UILabel = {
        let label = UILabel()
        label.text = "Ветер |  15 km/h"
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.addSmallShadow()
        label.textColor = .white
        return label
    }()
    
    let rainLabel: UILabel = {
        let label = UILabel()
        label.text = "Дождь | 26 %"
        label.font = UIFont(name: "Overpass-Regular", size: 18)
        label.addSmallShadow()
        label.textColor = .white
        return label
    }()
    
    let weatherButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: -3, height: 5)
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 6
        return button
    }()
    
    let buttonLable:UILabel = {
        let label = UILabel()
        label.text = "Прогноз на неделю"
        label.font = UIFont(name: "Overpass-Regular", size: 16)
        label.textColor = .black
        return label
    }()
    
    let arrowTop: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.up")
        image.contentMode = .scaleAspectFill
        image.tintColor = .black
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupConstraints()
        setupGradient()
    }
    
    func setupGradient() {
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 71 / 255, green: 191 / 255, blue: 223 / 255, alpha: 1).cgColor, UIColor(red: 74 / 255, green: 145 / 255, blue: 255 / 255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setupConstraints(){
        view.addSubview(line1)
        view.addSubview(line2)
        view.addSubview(cityView)
        cityView.addSubview(pointImage)
        cityView.addSubview(сityLabel)
        cityView.addSubview(downArrow)
        view.addSubview(notificationImage)
        view.addSubview(sunImage)
        view.addSubview(contentView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(infoView)
        infoView.addSubview(windImage)
        infoView.addSubview(rainImage)
        infoView.addSubview(windLabel)
        infoView.addSubview(rainLabel)
        
        view.addSubview(weatherButton)
        weatherButton.addSubview(buttonLable)
        weatherButton.addSubview(arrowTop)
        
        
        
        [line1, line2, cityView, pointImage, сityLabel, downArrow, notificationImage, sunImage, contentView, dateLabel, temperatureLabel, titleLabel, infoView, windImage, rainImage, windLabel, rainLabel, weatherButton, buttonLable, arrowTop].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            line1.widthAnchor.constraint(equalToConstant: 112),
            line1.heightAnchor.constraint(equalToConstant: 235),
            line1.topAnchor.constraint(equalTo: view.topAnchor, constant: 92),
            line1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -25),
            
            line2.widthAnchor.constraint(equalToConstant: 425),
            line2.heightAnchor.constraint(equalToConstant: 366.5),
            line2.topAnchor.constraint(equalTo: view.topAnchor, constant: -54),
            line2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 70),
            
            cityView.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            cityView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            cityView.widthAnchor.constraint(equalToConstant: 197),
            cityView.heightAnchor.constraint(equalToConstant: 37),
            
            pointImage.widthAnchor.constraint(equalToConstant: 24),
            pointImage.heightAnchor.constraint(equalToConstant: 24),
            pointImage.leadingAnchor.constraint(equalTo: cityView.leadingAnchor, constant: 0),
            pointImage.centerYAnchor.constraint(equalTo: cityView.centerYAnchor),
            
            сityLabel.centerYAnchor.constraint(equalTo: cityView.centerYAnchor),
            сityLabel.centerXAnchor.constraint(equalTo: cityView.centerXAnchor),
            
            downArrow.widthAnchor.constraint(equalToConstant: 9),
            downArrow.heightAnchor.constraint(equalToConstant: 6),
            downArrow.centerYAnchor.constraint(equalTo: cityView.centerYAnchor),
            downArrow.trailingAnchor.constraint(equalTo: cityView.trailingAnchor),
            
            notificationImage.widthAnchor.constraint(equalToConstant: 26),
            notificationImage.heightAnchor.constraint(equalToConstant: 24),
            notificationImage.centerYAnchor.constraint(equalTo: cityView.centerYAnchor),
            notificationImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            sunImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            sunImage.widthAnchor.constraint(equalToConstant: 300),
            sunImage.heightAnchor.constraint(equalToConstant: 300),
            sunImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            contentView.topAnchor.constraint(equalTo: sunImage.bottomAnchor, constant: -15),
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.widthAnchor.constraint(equalToConstant: 353),
            contentView.heightAnchor.constraint(equalToConstant: 335),
            
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            temperatureLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            temperatureLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 15),
            
            titleLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: -10),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 2),
            
            infoView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            infoView.widthAnchor.constraint(equalToConstant: 198),
            infoView.heightAnchor.constraint(equalToConstant: 72),
            infoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            windImage.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 2),
            windImage.leadingAnchor.constraint(equalTo: infoView.leadingAnchor,constant: 2),
            windImage.widthAnchor.constraint(equalToConstant: 20),
            windImage.heightAnchor.constraint(equalToConstant: 20),
            
            rainImage.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 2),
            rainImage.leadingAnchor.constraint(equalTo: infoView.leadingAnchor,constant: 2),
            rainImage.widthAnchor.constraint(equalToConstant: 20),
            rainImage.heightAnchor.constraint(equalToConstant: 20),
            
            windLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 2),
            windLabel.leadingAnchor.constraint(equalTo: windImage.trailingAnchor, constant: 20),
            
            rainLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 2),
            rainLabel.leadingAnchor.constraint(equalTo: rainImage.trailingAnchor, constant: 20),
            
            weatherButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0 ),
            weatherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherButton.widthAnchor.constraint(equalToConstant: 249),
            weatherButton.heightAnchor.constraint(equalToConstant: 64),
            
            buttonLable.centerYAnchor.constraint(equalTo: weatherButton.centerYAnchor),
            buttonLable.leadingAnchor.constraint(equalTo: weatherButton.leadingAnchor, constant: 28),
            
            arrowTop.centerYAnchor.constraint(equalTo: weatherButton.centerYAnchor),
            arrowTop.trailingAnchor.constraint(equalTo: weatherButton.trailingAnchor, constant: -23),
        ])
        
        weatherButton.addTarget(self, action: #selector(weatherButtonPressed), for: .touchUpInside)
    }

    @objc func weatherButtonPressed() {
        let vc = SecondWeatherViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}
