//
//  CustomTableViewController.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-09.
//

import UIKit

class CustomTableViewController: UIViewController {
    
    // MARK: Views
    public var myTableView = UITableView()
    var selectCellAction: () -> Void = { }
    var numberOfRows = 0
    var myCellIdentifier: String = ""
    var customViewCell: UIView = UIView()
    
    // MARK: Propeties
    var selectedIndex: Int = -1 // None selected
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sectionRect = myTableView.rect(forSection: 0)
        myTableView.scrollRectToVisible(sectionRect, animated: false)
        
        myTableView.dataSource = self
        myTableView.delegate = self
        view.addSubviews([myTableView])
        myTableView.sizeToSuperview()
    }
    
    // Aux Methods
    func configTableView<T: UITableViewCell>(with cellType: T.Type,
                                             withIdentifier: String,
                                             numberOfRows: Int,
                                             selectCellAction: @escaping () -> Void = {}) {
        myTableView.register(cellType, forCellReuseIdentifier: withIdentifier)
        myCellIdentifier = withIdentifier
        self.numberOfRows = numberOfRows
        self.selectCellAction = selectCellAction
        myTableView.reloadData()
    }
    
    func configureTableViewAction(selectCellAction: @escaping () -> Void = {}) {
        self.selectCellAction = selectCellAction
        myTableView.reloadData()
    }
}

// MARK: - TableView Methods
extension CustomTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows>0 ? numberOfRows : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCellIdentifier,
                                                 for: indexPath)
        cell.backgroundColor = indexPath.row == selectedIndex ? .gray : .darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectCellAction()
        
        selectedIndex = indexPath.row
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
