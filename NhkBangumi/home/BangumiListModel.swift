//
//  BangumiListModel.swift
//  NhkBangumi
//
//  Created by 大沼　陽平 on 2019/05/20.
//  Copyright © 2019 Youhei oonuma. All rights reserved.
//
import RxSwift

class BangumiListModel {

    let sharedSession = URLSession.shared

    func getBangumiList() -> Observable<JsonResonceFormat> {
        
        let responce: PublishSubject<JsonResonceFormat> = PublishSubject()

        let keyDic = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "apikey", ofType: "plist")!)
        guard let apikey = keyDic!["apikey"] else {
            fatalError("apikeyの設定をしてください")
        }
        
        let today = Calendar.getToday()

        let url = URL(string: "https://api.nhk.or.jp/v2/pg/list/130/g1/\(today).json?key=\(apikey)")!

        let task = sharedSession.dataTask(with: url) { data, response, error in

            if let error = error {
                responce.onError(error)
                return
            }
            let decoder = JSONDecoder()
            do {
                let json = try decoder.decode(JsonResonceFormat.self, from: data!)
                responce.onNext(json)
            } catch {
                responce.onError(error)
            }
        }
        task.resume()
        
        return responce.asObservable()
    }
}
