//
//  EmbeddedViewControllerWithCollectionView_ViewController.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-08.
//

import UIKit

class EmbeddedViewControllerWithCollectionView_ViewController: UIViewController {
    
    // MARK: Views
    var tableView = CustomTableViewController()
    var collectionView = CustomCollectionViewController()
    
    // MARK: Propeties
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension EmbeddedViewControllerWithCollectionView_ViewController: ViewCodable {
    func addHierarchy() {
        add([tableView,collectionView])
    }
    
    func addConstraints() {
        tableView.view
            .frameTopToBottom(of: self.navigationController?.navigationBar ?? self.view)
            .frameWidthToSuper(of: self.view)
            .frameCenterHorizontalToSuper(of: self.view)
            .frameToHeight(of: 200)
        
        collectionView.view
            .frameTopToBottom(of: tableView.view)
            .frameWidthToSuper(of: self.view)
            .frameCenterHorizontalToSuper(of: self.view)
            .frameToHeight(of: 500)
    }
    
    func additionalConfig() {
        self.view.backgroundColor = .systemYellow
        self.tableView.myTableView.backgroundColor = .orange
        self.collectionView.myCollectionView.backgroundColor = .purple
        
        tableView.configTableView(with: CustomTableViewCell.self,
                                  withIdentifier: "CustomTableViewCell",
                                  numberOfRows: 5,
                                  selectCellAction: selectedTableCellAction)
        
        collectionView.configCollectionView(with: CustomCollectionViewCell.self,
                                            withIdentifier: "CustomCollectionViewCell",
                                            numberOfRows: 5,
                                            numberOfSections: 3,
                                            scrollDirection: .horizontal,
                                            selectCellAction: selectedCollectionCellAction)
    }
    
    func selectedTableCellAction() {
        self.alert(title: "hello", message: "TABLE!", button: "bye bye")
    }
    
    func selectedCollectionCellAction() {
        self.alert(title: "hello", message: "COLLECTION!", button: "bye bye")
    }
}


