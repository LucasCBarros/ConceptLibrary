//
//  CustomCollectionViewController.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-04-09.
//

import UIKit

class CustomCollectionViewController: UIViewController {
    
    // MARK: Views
    public var myCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    var selectCellAction: () -> Void = { }
    
    var numberOfRows = 0
    var numberOfSections = 0
    var myCellIdentifier: String = ""
    var customViewCell: UIView = UIView()
    
    // MARK: Propeties
    var selectedSectionIndex: Int = -1 // None selected
    var selectedRowIndex: Int = -1 // None selected
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 50
//        layout.minimumInteritemSpacing = 30
        myCollectionView.setCollectionViewLayout(layout, animated: true)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        view.addSubviews([myCollectionView])
        myCollectionView.sizeToSuperview()
        
        if let flowLayout = myCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
              flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    // Aux Methods
    func configCollectionView<T: UICollectionViewCell>(with cellType: T.Type,
                                                       withIdentifier: String,
                                                       numberOfRows: Int,
                                                       numberOfSections: Int,
                                                       scrollDirection: UICollectionView.ScrollDirection = .vertical,
                                                       selectCellAction: @escaping () -> Void = {}) {
        myCollectionView.register(cellType, forCellWithReuseIdentifier: withIdentifier)
        myCellIdentifier = withIdentifier
        
        self.numberOfRows = numberOfRows
        self.numberOfSections = numberOfSections
        layout.scrollDirection = scrollDirection
        
        self.selectCellAction = selectCellAction
        
        myCollectionView.reloadData()
    }
    
    func configureCollectionViewAction(selectCellAction: @escaping () -> Void = {}) {
        self.selectCellAction = selectCellAction
        myCollectionView.reloadData()
    }
}

// MARK: - TableView Methods
extension CustomCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfSections>0 ? numberOfSections : 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        numberOfRows>0 ? numberOfRows : 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myCellIdentifier,
                                                      for: indexPath)
        cell.backgroundColor = indexPath.row == selectedRowIndex
        && indexPath.section == selectedSectionIndex
        ? .gray : .darkGray
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectCellAction()
        
        selectedSectionIndex = indexPath.section
        selectedRowIndex = indexPath.row
        collectionView.reloadData()
    }
}
