//
//  HomeViewController.swift
//  NhkBangumi
//
//  Created by 大沼　陽平 on 2019/05/17.
//  Copyright © 2019 Youhei oonuma. All rights reserved.
//

import UIKit
import MaterialComponents

class HomeViewController: UIViewController {

    var appBarViewController = MDCAppBarViewController()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set up AppBarController
        appBarViewController.didMove(toParent: self)
        appBarViewController.navigationBar.titleTextColor = .black
        appBarViewController.navigationBar.title = "NHK Bangumi"
        view.addSubview(appBarViewController.view)
        MDCAppBarColorThemer.applyColorScheme(ApplicationScheme.share.colorScheme, to: appBarViewController)
    }

}

