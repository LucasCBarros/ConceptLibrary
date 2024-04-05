//
//  ConceptsListViewController.swift
//  ConceptLibrary
//
//  Created by Lucas C Barros on 2024-03-25.
//

import UIKit

class ConceptsListViewController: UIViewController {
    // MARK: UI Components
    private let tableView = UITableView()
    
    // MARK: Variables
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    @objc private func openInfoViewController() {
        let vc = LayoutIfNeeded_ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func openCurrentViewController() {
        let vc = LayoutIfNeeded_ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ConceptsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Concepts.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConceptCell.identifier, for: indexPath) as? ConceptCell else {
            fatalError("The tableView could not dequeue a ConceptCell in ViewController")
        }
        let currentConcept = Concepts.allCases[indexPath.row]
        
        cell.configure(title: currentConcept.title,
                       description: currentConcept.description)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let openConcept = Concepts.allCases[indexPath.row].ViewController()
        openConcept.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(openConcept, animated: true)
    }
}

// MARK: - Setup UI
extension ConceptsListViewController: ViewCodable {
    func addHierarchy() {
        self.view.addSubviews([tableView])
    }
    
    func addConstraints() {
        tableView.sizeToSuperview()
    }
    
    func additionalConfig() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.backgroundColor = .clear
        tableView.allowsSelection = true
        tableView.register(ConceptCell.self, forCellReuseIdentifier: "ConceptCell")
        
        self.navigationController?.navigationBar.backgroundColor = .systemMint
        self.navigationItem.title = "Concept List"
        
        // Search option? Filter? Favorites? Expand all
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "In Progress",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(openCurrentViewController))
        
        // Add info & github repo
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"),
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(openInfoViewController))
    }
}
