//
//  ViewController.swift
//  TableView
//
//  Created by Danil Goncharov on 15.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    enum CellType {
        case normal
        case switchable
        case description
    }
    
    struct ItemModel {
        let type: CellType
        let title: String
        let image: UIImage?
        var descr: String? = nil
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return tableView
    }()
    
    private var sections = ["SectionOne", "SectionTwo", "SectionThree"]
    
    private var data = [[ItemModel(type: .switchable, title: "Авиарежим", image: UIImage(systemName: "airplane")),
                        ItemModel(type: .description, title: "Wi-Fi", image: UIImage(systemName: "wifi"), descr: "Не подключено"),
                        ItemModel(type: .description, title: "Bluetooth", image: UIImage(named: "bluetooth"), descr: "Вкл."),
                        ItemModel(type: .normal, title: "Сотовая связь", image: UIImage(systemName: "antenna.radiowaves.left.and.right")),
                        ItemModel(type: .description, title: "Режим модема", image: UIImage(systemName: "personalhotspot"), descr: "Выкл."),
                        ItemModel(type: .switchable, title: "VPN", image: UIImage(named: "VPN"))],
                        [ItemModel(type: .normal, title: "Уведомления", image: UIImage(systemName: "bell.badge")),
                        ItemModel(type: .normal, title: "Звуки, тактильные сигналы", image: UIImage(systemName: "speaker.wave.3")),
                        ItemModel(type: .normal, title: "Не беспокоить", image: UIImage(systemName: "moon")),
                        ItemModel(type: .normal, title: "Экранное время", image: UIImage(systemName: "hourglass"))],
                        [ItemModel(type: .normal, title: "Основное", image: UIImage(systemName: "gear")),
                        ItemModel(type: .normal, title: "Пункт управления", image: UIImage(systemName: "switch.2")),
                        ItemModel(type: .normal, title: "Экран и яркость", image: UIImage(systemName: "textformat.size")),
                        ItemModel(type: .normal, title: "Экран «Домой»", image: UIImage(systemName: "apps.iphone")),
                        ItemModel(type: .normal, title: "Универсальный доступ", image: UIImage(systemName: "person.circle")),
                        ItemModel(type: .normal, title: "Обои", image: UIImage(systemName: "sun.max")),
                        ItemModel(type: .normal, title: "Siri и поиск", image: UIImage(systemName: "network")),
                        ItemModel(type: .normal, title: "Touch ID и код-пароль", image: UIImage(systemName: "touchid")),
                        ItemModel(type: .normal, title: "Экстренный вызов - SOS", image: UIImage(systemName: "exclamationmark.square")),
                        ItemModel(type: .normal, title: "Уведомления и контакте", image: UIImage(systemName: "wand.and.rays")),
                        ItemModel(type: .normal, title: "Аккумулятор", image: UIImage(systemName: "battery.100")),
                        ItemModel(type: .normal, title: "Конфиденциальность", image: UIImage(systemName: "hand.raised"))]
    ]
    
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

extension ViewController: UITableViewDataSource,  UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.imageView?.image = data[indexPath.section][indexPath.row].image
        
        switch data[indexPath.section][indexPath.row].type {
        case .normal:
            cell.accessoryType = .disclosureIndicator
        case .switchable:
            cell.accessoryView = UISwitch()
        case .description:
            cell.detailTextLabel?.text = data[indexPath.section][indexPath.row].descr
            cell.detailTextLabel?.shadowColor = .gray
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячейка \(data[indexPath.section][indexPath.row].title)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
