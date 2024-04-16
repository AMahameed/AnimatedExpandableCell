//
//  ViewController.swift
//  AnimatedExpandableCell
//
//  Created by Abdallah Mahameed on 16/04/2024.
//

import UIKit

class ViewController: UITableViewController {
    
    private var selectedIndex = IndexPath(row: 0, section: 0)
    
    fileprivate var cellData = [
        Cell(title: "Mustafa", subTitle: "60"),
        Cell(title: "Laith", subTitle: "33"),
        Cell(title: "Abdallah", subTitle: "23")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ExpandableAnimatedCell.self, forCellReuseIdentifier: ExpandableAnimatedCell.cellID)
    }
}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return if selectedIndex == indexPath{
            200
        } else {
            60
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableAnimatedCell.cellID)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
}

struct Cell {
    var title: String
    var subTitle: String
}

