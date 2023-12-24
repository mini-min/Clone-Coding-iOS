//
//  MainViewController.swift
//  Clone-Weather
//
//  Created by 민 on 12/20/23.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    var locationWeatherList = [LocationWeather]()
    
    // MARK: - UI Components
    private let searchController = UISearchController()
    private let mainTableView = MainTableView().mainTableView
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
        setNavigationBar()
        setSearchBar()
        getLocationWeatherWithAPI(location: "seoul")
    }
}

// MARK: - Extensions
extension MainViewController {
    func setUI() {
        
    }
    
    func setHierarchy() {
        self.view.addSubview(mainTableView)
    }
    
    func setLayout() {
        mainTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setDelegate() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    // 네비게이션바 세팅
    private func setNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.title = "Weather"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"),
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // 서치바 세팅
    private func setSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.placeholder = "Search for a city or airport"
    }
}

// MARK: - UITableView Delegate/DataSource

extension MainViewController: UITableViewDelegate {}
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationWeatherList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainLocationTableViewCell.dequeueReusableCell(tableView: mainTableView, indexPath: indexPath)
        cell.bindData(data: locationWeatherList[indexPath.row], row: indexPath.row)
        return cell
    }
}

// MARK: - Network

extension MainViewController {
    func getLocationWeatherWithAPI(location: String) {
        MainAPI.shared.getLocationWeather(location: location, completion: { response in
            DispatchQueue.main.async {
                switch response {

                case .success(let data):
                    if let data = data as? LocationWeather {
                        self.locationWeatherList.append(data)
                    }
                case .requestErr(let statusCode):
                    print("requestErr", statusCode)
                case .pathErr:
                    print(".pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
            }
        })
    }
}
