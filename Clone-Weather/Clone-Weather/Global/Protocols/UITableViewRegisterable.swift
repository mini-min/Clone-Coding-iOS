//
//  UITableViewRegisterable.swift
//  Clone-Weather
//
//  Created by 민 on 12/24/23.
//

import UIKit

public protocol UITableViewRegisterable where Self: UITableViewCell {
    static func register(tableView: UITableView)
    static func dequeueReusableCell(tableView: UITableView, indexPath: IndexPath) -> Self
    static var reuseIdentifier: String { get }
}

extension UITableViewRegisterable {
    public static func register(tableView: UITableView) {
        tableView.register(Self.self, forCellReuseIdentifier: self.reuseIdentifier)
    }

    public static func dequeueReusableCell(tableView: UITableView, indexPath: IndexPath) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as? Self else { fatalError("Error! \(self.reuseIdentifier)")}
        return cell
    }
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
