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
        Cell(title: "Jack", subTitle: "47"),
        Cell(title: "Daniel", subTitle: "33"),
        Cell(title: "Abdallah", subTitle: "23")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ExpandableAnimatedCell.self, forCellReuseIdentifier: ExpandableAnimatedCell.cellID)
        tableView.separatorStyle = .none
    }
}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndex == indexPath {
            return 200
        }
        return 60
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableAnimatedCell.cellID) as! ExpandableAnimatedCell
       
        cell.cellData = cellData[indexPath.row]
        cell.selectionStyle = .none
        cell.animateCell()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.endUpdates()
        
    }
    
}

struct Cell {
    var title: String
    var subTitle: String
}

