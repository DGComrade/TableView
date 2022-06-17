//
//  ViewController.swift
//  TableView
//
//  Created by Danil Goncharov on 15.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    func configureView(with model: [Section]) {
        self.models = model
    }
    
    var models = [Section]()
    
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return tableView
        
    }()
    // MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        setupDelegate()
    }
   
    private func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
    // MARK: - Settings Cells

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.textLabel?.text = models[indexPath.section].content[indexPath.row].title
        cell.imageView?.image = models[indexPath.section].content[indexPath.row].image
        
        switch models[indexPath.section].content[indexPath.row].type {
        case .normal:
            cell.accessoryType = .disclosureIndicator
        case .switchable:
            cell.accessoryView = UISwitch()
        case .description:
            cell.detailTextLabel?.text = models[indexPath.section].content[indexPath.row].descr
            cell.detailTextLabel?.shadowColor = .gray
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка \(models[indexPath.section].content[indexPath.row].title)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
