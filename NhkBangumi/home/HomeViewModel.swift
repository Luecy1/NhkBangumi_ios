//
//  HomeViewModel.swift
//  NhkBangumi
//
//  Created by 大沼　陽平 on 2019/05/20.
//  Copyright © 2019 Youhei oonuma. All rights reserved.
//
import RxSwift
import RxCocoa

class HomeViewModel {

    let disposeBag = DisposeBag()

    let bangumiList: Driver<[Program]>

    let itemClick: Observable<Program>

    init(_ model: BangumiListModel, itemSelected: ControlEvent<IndexPath>) {

        bangumiList = model.getBangumiList()
            .map { json in
                return json.list.g1
            }.asDriver(onErrorJustReturn: [])

        itemClick = Observable.combineLatest(itemSelected, bangumiList.asObservable()) { (index, bangumiList) in
            return bangumiList[index.row]
        }
    }
}
