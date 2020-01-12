//
//  SecondViewController.swift
//  SampleTableView
//
//  Created by TAKUMA NAKAMURA on 2020/01/12.
//  Copyright © 2020 NakamuraTakuma. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    
    // TodoList = ["牛乳を買う", "掃除をする", "アプリ開発の勉強をする"]
    //    2次元配列(配列の入った配列)の内容をFirstViewControllerのTodoList内容に合わせて変える
    var list = [["スーパー行く","カゴに牛乳入れる","レジに向かう"],["ものを片付ける","床を掃く","ゴミを捨てる"],["XCode開く","ググる","コピペする"]]
    var passedIndexNum :Int!
    @IBOutlet var secondTableView: UITableView!
    
    override func viewDidLoad() {
        secondTableView.dataSource = self
        //        余計な線を消す
        secondTableView.tableFooterView = UIView()
    }
    //    表示するセルの個数を返す関数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[passedIndexNum].count
    }
    //    セルの内容を返す関数
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する(StoryBoardのセルのIdentifierに" Cell"って書くの忘れずに！)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = list[passedIndexNum][indexPath.row]
        return cell
    }
    
}
