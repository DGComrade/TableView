//
//  Model.swift
//  TableView
//
//  Created by Danil Goncharov on 17.11.2021.
//

import UIKit

final class TableViewModel {
    
    func createModel() -> [Section] {
        return [
            
            //SectionOne
            Section(title: "", content: [
                    ItemModel(type: .switchable, title: "Авиарежим", image: UIImage(systemName: "airplane")),
                    ItemModel(type: .description, title: "Wi-Fi", image: UIImage(systemName: "wifi"), descr: "Не подключено"),
                    ItemModel(type: .description, title: "Bluetooth", image: UIImage(named: "bluetooth"), descr: "Вкл."),
                    ItemModel(type: .normal, title: "Сотовая связь", image: UIImage(systemName: "antenna.radiowaves.left.and.right")),
                    ItemModel(type: .description, title: "Режим модема", image: UIImage(systemName: "personalhotspot"), descr: "Выкл."),
                    ItemModel(type: .switchable, title: "VPN", image: UIImage(named: "VPN"))]),
                    
            //SectionTwo
            Section(title: "", content: [
                    ItemModel(type: .normal, title: "Уведомления", image: UIImage(systemName: "bell.badge")),
                    ItemModel(type: .normal, title: "Звуки, тактильные сигналы", image: UIImage(systemName: "speaker.wave.3")),
                    ItemModel(type: .normal, title: "Не беспокоить", image: UIImage(systemName: "moon")),
                    ItemModel(type: .normal, title: "Экранное время", image: UIImage(systemName: "hourglass"))]),
            
            //SectionThree
            Section(title: "", content: [
                    ItemModel(type: .normal, title: "Основное", image: UIImage(systemName: "gear")),
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
                    ItemModel(type: .normal, title: "Конфиденциальность", image: UIImage(systemName: "hand.raised"))])
        ]
    }
}
