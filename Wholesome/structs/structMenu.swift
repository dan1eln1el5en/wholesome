//
//  structMenu.swift
//  Wholesome
//
//  Created by Daniel Nielsen on 14/09/2019.
//  Copyright © 2019 Wholesome Studios. All rights reserved.
//

import Foundation

struct ResponseData: Decodable {
    var mainMenu: [MainMenu]
}
class MainMenu : Decodable {
    var title: String
    var category: String
    var color: String
    var status: String
}

class Menus: Decodable {
    var menu: [MainMenu]?
    
    init(fileName : String){
        // url, data and jsonData should not be nil
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        guard let jsonData = try? JSONDecoder().decode(ResponseData.self, from: data) else { return }
        // assigns the value to [person]
        menu = jsonData.mainMenu
    }
}
/*
func loadJson(filename fileName: String) -> [MainMenu]? {
    
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: data)
            //print(jsonData.mainMenu[1].title)

            
            return jsonData.mainMenu
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
*/
