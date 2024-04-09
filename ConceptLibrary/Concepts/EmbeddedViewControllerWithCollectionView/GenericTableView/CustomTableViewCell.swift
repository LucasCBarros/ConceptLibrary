//
//  CustomTableViewCell.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-08.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    private let itemImageView = UIImageView()
    private let arrowImageView = UIImageView()
    private let titleLabel = UILabel()
    private let lenderNameLabel = UILabel()
    private let returnDateLabel = UILabel()
    private let horizontalContentStackView = UIStackView()
    private let verticalLabelStackView = UIStackView()
    
    override func awakeFromNib() { super.awakeFromNib() }
    required init?(coder: NSCoder) { fatalError() }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: CustomTableViewCell.identifier)
        setupUI()
    }
}

extension CustomTableViewCell: ViewCodable {
    func addHierarchy() {
        verticalLabelStackView.addArrangedSubviews([titleLabel,
                                                    lenderNameLabel,
                                                    returnDateLabel])
        
        horizontalContentStackView.addArrangedSubviews([itemImageView,
                                                verticalLabelStackView,
                                                arrowImageView])
        
        contentView.addSubviews([horizontalContentStackView])
    }
    
    func addConstraints() {
        contentView
            .heightTo(100)
            .widthToSuperview()
        
        horizontalContentStackView
            .widthToSuperview(-20)
            .heightToSuperview(-10)
            .centerToSuperview()
        
        horizontalContentStackView.layer.borderWidth = 3
        horizontalContentStackView.layer.borderColor = UIColor.red.cgColor
        horizontalContentStackView.layer.cornerRadius = 10
        
        itemImageView
            .heightToSuperview(-10)
            .aspectRatio()
            .leadingToSuperview(5)
        
        
        arrowImageView
            .heightToSuperview(-10)
            .widthTo(30)
            .trailingToSuperview(30)
    }
    
    func additionalConfig() {
        verticalLabelStackView.axis = .vertical
        
        horizontalContentStackView.axis = .horizontal
        horizontalContentStackView.spacing = 5
        horizontalContentStackView.alignment = .center
        
        
        itemImageView.image = UIImage(systemName: "heart.fill")
        arrowImageView.image = UIImage(systemName: "star")
        
        titleLabel.text = "Title"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        lenderNameLabel.text = "Lucas"
        lenderNameLabel.font = titleLabel.font.withSize(15)
        
        returnDateLabel.text = "21th Oct 2023"
        returnDateLabel.font = titleLabel.font.withSize(10)
    }
}
