//
//  ExpandableAnimatedCell.swift
//  AnimatedExpandableCell
//
//  Created by Abdallah Mahameed on 16/04/2024.
//

import UIKit

class ExpandableAnimatedCell: UITableViewCell {
        
    static let cellID = String(describing: ExpandableAnimatedCell.self)
    
    func animateCell() {
        UIView.animate(withDuration: 0.3, delay: 0.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.contentView.layoutIfNeeded()
        })
    }
    
    var cellData: Cell? {
        didSet {
            guard let cellData = cellData else { return }
            title.text = cellData.title
            subTitle.text = cellData.subTitle
        }
    }
    
    private let title: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let subTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textAlignment = .center
        label.numberOfLines = -1
        return label
    }()
    
    private let container: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemBlue
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(container)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            contentView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 5),
            contentView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 5)
        ])
        
        container.addSubview(title)
        container.addSubview(subTitle)
        
        title.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        title.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        subTitle.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        subTitle.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        subTitle.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
