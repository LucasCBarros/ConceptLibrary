//
//  ConceptCell.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-03-25.
//

import UIKit

class ConceptCell: UITableViewCell {
    // MARK: - UI Components
    private let expandCellButton = UIButton()
    private let conceptTitle = UILabel()
    private let conceptDescription = UILabel()
    
    // MARK: Variables
    static let identifier = "ConceptCell"
    private var conceptDescriptionHeight = NSLayoutConstraint()
    private var shouldExpandDescription = false
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    // Add information
    public func configure(title: String, description: String = "") {
        self.conceptTitle.text = title
        self.conceptDescription.text = description
    }
    
    @objc private func expandCellDescription() {
        shouldExpandDescription.toggle()
        addDescriptionConstraints()
        self.contentView.layoutIfNeeded()
    }
}

// MARK: - Setup UI
extension ConceptCell: ViewCodable {
    func addHierarchy() {
        self.contentView.addSubviews([expandCellButton,
                                      conceptTitle,
                                      conceptDescription])
    }
    
    func addConstraints() {
        
        expandCellButton
            .verticalToSuperview()
            .leadingToSuperview()
            .heightTo(50)
            .aspectRatio()
        
        conceptTitle
            .topToSuperview()
            .heightTo(50)
            .leadingToTrailing(of: expandCellButton, margin: 16)
            .trailingToSuperview(-12)
        
        addDescriptionConstraints()
    }
    
    func addDescriptionConstraints() {
        if shouldExpandDescription {
            contentView.addSubviews([conceptDescription])
            conceptDescription
                .topToBottom(of: conceptTitle, margin: -10)
                .leadingToTrailing(of: expandCellButton, margin: 16)
                .trailingToSuperview(12)
                .backgroundColor = .lightGray
        } else {
            conceptDescription.removeFromSuperview()
        }
    }
    
    func additionalConfig() {
        expandCellButton.setImage(UIImage(systemName: "doc.text.magnifyingglass"), for: .normal)
        expandCellButton.addTarget(self, action: #selector(expandCellDescription), for: .touchUpInside)
        expandCellButton.tintColor = .label
        expandCellButton.contentVerticalAlignment = .fill
        expandCellButton.contentHorizontalAlignment = .fill
        expandCellButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        conceptTitle.textAlignment = .left
        conceptTitle.font = .systemFont(ofSize: 24, weight: .heavy)
        conceptTitle.text = "Error"
        
        conceptDescription.textAlignment = .left
        conceptDescription.font = .systemFont(ofSize: 16, weight: .light)
        conceptDescription.text = "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        conceptDescription.numberOfLines = 0
        conceptDescription.lineBreakMode = .byWordWrapping
        conceptDescription.layer.cornerRadius = 5
        conceptDescription.layer.masksToBounds = true
    }
}
