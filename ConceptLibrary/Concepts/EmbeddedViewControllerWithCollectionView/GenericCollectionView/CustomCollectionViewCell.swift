//
//  CustomCollectionViewCell.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-09.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    private let itemImageView = UIImageView()
    private let arrowImageView = UIImageView()
    private let titleLabel = UILabel()
    private let lenderNameLabel = UILabel()
    private let returnDateLabel = UILabel()
    private let horizontalContentStackView = UIStackView()
    private let verticalLabelStackView = UIStackView()
    
    override func awakeFromNib() { super.awakeFromNib() }
    required init?(coder: NSCoder) { fatalError() }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
}

extension CustomCollectionViewCell: ViewCodable {
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
//            .widthToSuperview()
            .widthTo(200)
        
        horizontalContentStackView
            .widthToSuperview()
            .heightToSuperview()
            .centerToSuperview()
        
        horizontalContentStackView.layer.borderWidth = 3
        horizontalContentStackView.layer.borderColor = UIColor.red.cgColor
        horizontalContentStackView.layer.cornerRadius = 10
        
        itemImageView
            .heightToSuperview(-10)
            .aspectRatio()
            .leadingToSuperview(5)
            .backgroundColor = .purple
        
        
        arrowImageView
            .heightToSuperview(-10)
            .widthTo(30)
            .trailingToSuperview(30)
            .backgroundColor = .cyan
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
