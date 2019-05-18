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
        appBarViewController.headerView.trackingScrollView = self.collectionView

        // set up CollectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = ApplicationScheme.share.colorScheme.backgroundColor

    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardView", for: indexPath) as! MDCCardCollectionCell

        cell.applyTheme(withScheme: MDCContainerScheme())

        return cell
    }
}

class MyCardViewCell: MDCCardCollectionCell {

}
