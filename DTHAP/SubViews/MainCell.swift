//
//  MainCell.swift
//  DTHAP
//
//  Created by Shanezzar Sharon on 15/01/2022.
//

import UIKit
import SDWebImage

class MainCell: UITableViewCell {

    // MARK:- variables
    let gifImageView = SDAnimatedImageView()
    let titleLabel = UILabel()
    let usernameLabel = UILabel()
    
    
    // MARK:- functions
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        
    }
    
    func setupUI() {
        gifImageView.translatesAutoresizingMaskIntoConstraints = false
        gifImageView.layer.masksToBounds = true
        gifImageView.sd_imageIndicator = SDWebImageActivityIndicator.large
        gifImageView.contentMode = .scaleAspectFill
        gifImageView.layer.cornerRadius = 8
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.titleColor
        titleLabel.font = UIFont.init(name: CustomFont.sofiaProSemiBold, size: 14)
        titleLabel.numberOfLines = 0
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.textColor = UIColor.titleColor
        usernameLabel.font = UIFont.init(name: CustomFont.sofiaProLight, size: 12)
        usernameLabel.numberOfLines = 0
        
        let verticalStackView = UIStackView()
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 16
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(usernameLabel)
        
        
        contentView.addSubview(gifImageView)
        contentView.addSubview(verticalStackView)
        
        
        NSLayoutConstraint.activate([
            gifImageView.widthAnchor.constraint(equalToConstant: 100),
            gifImageView.heightAnchor.constraint(equalToConstant: 100),
            gifImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            gifImageView.trailingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: -16),
            gifImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            gifImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            verticalStackView.centerYAnchor.constraint(equalTo: gifImageView.centerYAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
