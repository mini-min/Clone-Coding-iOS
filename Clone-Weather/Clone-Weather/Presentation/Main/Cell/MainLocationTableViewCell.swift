//
//  MainLocationTableViewCell.swift
//  Clone-Weather
//
//  Created by 민 on 12/21/23.
//

import UIKit

final class MainLocationTableViewCell: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let weatherImageView = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "listCloudImage")
    }
    private let myLocationLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .bold(size: 25)
    }
    private let cityLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .light(size: 16)
    }
    private let weatherLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .light(size: 16)
    }
    private let tempLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .medium(size: 53)
    }
    private let maxMinTempLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .light(size: 15)
    }
    
    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension MainLocationTableViewCell {
    func setUI() {
        self.backgroundColor = .black
    }
    
    func setHierarchy() {
        addSubview(weatherImageView)
        weatherImageView.addSubViews(myLocationLabel, cityLabel, weatherLabel, tempLabel, maxMinTempLabel)
    }
    
    func setLayout() {
        weatherImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        myLocationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(16)
        }
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(myLocationLabel.snp.bottom).inset(0)
            make.leading.equalToSuperview().inset(16)
        }
        weatherLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(11)
        }
        tempLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.trailing.equalToSuperview().inset(13)
        }
        maxMinTempLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(11)
            make.trailing.equalToSuperview().inset(13)
        }
    }
    
    func bindData(data: LocationWeather, row: Int) {
        self.myLocationLabel.text = data.name
        self.weatherLabel.text = data.weather[0].main
        self.cityLabel.text = String(data.timezone)
        self.tempLabel.text = String(Int(data.main.temp)) + "˚"
        self.maxMinTempLabel.text = "최고:" + String(Int(data.main.tempMax)) + "˚" + " 최저:" + String(Int(data.main.tempMin)) + "˚"
    }
}
