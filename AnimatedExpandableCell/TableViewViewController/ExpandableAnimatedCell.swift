//
//  ExpandableAnimatedCell.swift
//  AnimatedExpandableCell
//
//  Created by Abdallah Mahameed on 16/04/2024.
//

import UIKit

class ExpandableAnimatedCell: UITableViewCell {
        
    static let cellID = String(describing: ExpandableAnimatedCell.self)
    
    fileprivate var title: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
    }()
    
    fileprivate var subTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textAlignment = .center
        label.numberOfLines = -1
    }()
    
    private let container: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemBlue
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(container)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            contentView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 5),
            contentView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 5)
        ])
        
        container.addSubview(title)
        container.addSubview(subTitle)
    }
    
    fileprivate func animateCell() {
        UIView.animate(withDuration: 0.4, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 1) {
            self.contentView.layoutIfNeeded()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
