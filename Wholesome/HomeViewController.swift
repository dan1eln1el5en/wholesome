//
//  HomeViewController.swift
//  Wholesome
//
//  Created by Daniel Nielsen on 21/08/2019.
//  Copyright © 2019 Wholesome Studios. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    private let reuseIdentifier = "welcomeCell"
    let fileSource = "source"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //let mainMenu: [MainMenu] = loadJson(filename: fileSource)!
        let menus = Menus(fileName: fileSource)
        if let menuArr = menus.menu {
            return menuArr.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as UICollectionViewCell
        let menus = Menus(fileName: fileSource)
        /*if let menuArr = Array(menus.menu) {
            print(menuArr)
        }*/
        
        
        return cell
    }
}

