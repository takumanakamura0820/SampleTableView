//
//  ViewController.swift
//  SampleTableView
//
//  Created by TAKUMA NAKAMURA on 2020/01/12.
//  Copyright © 2020 NakamuraTakuma. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
    let TodoList = ["牛乳を買う", "掃除をする", "アプリ開発の勉強をする"]
    @IBOutlet var firstTableView: UITableView!
//    下のdidSelectRowAtの関数で使う、選択されたセルのインデックスを入れる変数
    var selectedIndexNum :Int!
    
    override func viewDidLoad() {
        firstTableView.dataSource = self
        firstTableView.delegate = self
//        余計な線を消す
        firstTableView.tableFooterView = UIView()
        setRefreshControl()
    }
//    表示するセルの個数を返す関数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoList.count
    }
//    セルの内容を返す関数
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する(StoryBoardのセルのIdentifierに"cell"って書くの忘れずに！)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = TodoList[indexPath.row]
        return cell
    }
    
    
//    セルが選択された時に渡す
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 選択されたcellの番号を記憶
        selectedIndexNum = indexPath.row
        // 画面遷移の準備
        performSegue(withIdentifier: "toSecond",sender: nil)
//        Main.StoryBoardにてFirstViewControllerを選択して(3つあるうちのボタンのうち一番左！)controlキー押しながらドラッグ&ドロップしてshowを選択！
//        segue(ViewController同士を繋いでる線)のidentifierをtoSecondに変えるのを忘れずに！
    }
    // 値渡しをします
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        // 遷移先のViecControllerのインスタンスを生成
        let nextVC = (segue.destination as? SecondViewController)!
        // secondViewControllerのpasseindexNumにFirstViewControllerのselectedIndexNum
        nextVC.passedIndexNum = selectedIndexNum

    }
    
//    引っ張ってぎグルグルさせるUI
    func setRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadTimeline(refreshControl:)), for: .valueChanged)
        firstTableView.addSubview(refreshControl)
    }
    //    引っ張ってぎグルグルさせるUI
    @objc func reloadTimeline(refreshControl: UIRefreshControl) {
        refreshControl.beginRefreshing()
        
        // 更新が早すぎるので2秒遅延させる
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            refreshControl.endRefreshing()
        }
    }
    
}

