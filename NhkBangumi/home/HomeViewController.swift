//
//  HomeViewController.swift
//  NhkBangumi
//
//  Created by 大沼　陽平 on 2019/05/17.
//  Copyright © 2019 Youhei oonuma. All rights reserved.
//

import UIKit
import MaterialComponents
import Kingfisher
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    var appBarViewController = MDCAppBarViewController()

    @IBOutlet weak var collectionView: UICollectionView!

    let containerScheme = MDCContainerScheme()

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // set up AppBarController
        appBarViewController.didMove(toParent: self)
        appBarViewController.navigationBar.titleTextColor = .black
        appBarViewController.navigationBar.title = "NHK Bangumi"
        MDCAppBarColorThemer.applyColorScheme(ApplicationScheme.share.colorScheme, to: appBarViewController)

        // Behavioral flags.
        appBarViewController.inferTopSafeAreaInsetFromViewController = true
        appBarViewController.headerView.minMaxHeightIncludesSafeArea = false
        self.addChild(appBarViewController)

        appBarViewController.headerView.observesTrackingScrollViewScrollEvents = true

        view.addSubview(appBarViewController.view)

        appBarViewController.didMove(toParent: self)


        // set up CollectionView
        collectionView.alwaysBounceVertical = true
        collectionView.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10)

        appBarViewController.headerView.trackingScrollView = self.collectionView

        // set up viewmodel
        let viewmodel = HomeViewModel(BangumiListModel(), itemSelected: collectionView.rx.itemSelected)

        _ = viewmodel.bangumiList.asObservable().bind(to: collectionView.rx.items(cellIdentifier: "cardView", cellType: MyCardViewCell.self)) {
            [weak self] row, element, cell in

            cell.setImageTintColor(.blue, for: .dragged)
            cell.cornerRadius = 8
            cell.setShadowColor(UIColor.black, for: .highlighted)
            cell.setBorderWidth(1.0, for: .normal)

            if let scheme = self?.containerScheme {
                cell.applyTheme(withScheme: scheme)
            }

            let url = URL(string: "https://www.nhk.or.jp/common/img/media/gtv-200x100.png")
            cell.bangumiLogo.kf.setImage(with: url)

            cell.title.text = element.title
            cell.subtitle.text = element.subtitle

        }.disposed(by: disposeBag)

        viewmodel.itemClick.subscribe(onNext: { bangumi in
            self.pushDetail(programId: bangumi.id)
        }).disposed(by: disposeBag)
    }

    private func pushDetail(programId: String) {
        // TODO:detailに遷移する処理
        let storyboard: UIStoryboard = UIStoryboard(name: "Detail", bundle: nil)
        let next: UIViewController = storyboard.instantiateInitialViewController() as! UIViewController
        present(next, animated: true, completion: nil)

        // 下記、どれもうまくいかない
//        appBarViewController.showDetailViewController(next, sender: nil)
//        navigationController?.pushViewController(next, animated: true)
//        appBarViewController.navigationController?.pushViewController(next, animated: true)
    }
}


class MyCardViewCell: MDCCardCollectionCell {

    @IBOutlet weak var bangumiLogo: UIImageView!

    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var subtitle: UILabel!

}
