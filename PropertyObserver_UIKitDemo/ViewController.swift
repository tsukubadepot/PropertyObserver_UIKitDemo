//
//  ViewController.swift
//  PropertyObserver_UIKitDemo
//
//  Created by Jun Yamashita on 2020/10/30.
//

import UIKit

class ViewController: UIViewController {
    // プロパティオブザーバを利用して、UI パーツの詳細を設定する
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            // dataSource の設定
            tableView.dataSource = self
        }
    }
    
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            // ボタンを角丸にする
            addButton.layer.cornerRadius = 25
            // 背景色を UIColor.systemPink にする
            addButton.backgroundColor = .systemPink
            // 文字色を白にする
            addButton.tintColor = .white
        }
    }
    
    // UITableView に表示するデータ
    var datas: [String] = [] {
        didSet {
            // 配列に値が追加された後実行される内容
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // プロパティオブザーバを使ったので、ここで UI パーツの設定を行う必要はない。
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        // 100...999 の間の乱数を作成し、String 型にする
        let data = Int.random(in: 100...999).description
        
        // 配列に追加
        datas.append(data)
        
        // ここで tableView.reloadData() を実行しなくても、
        // プロパティオブザーバを使うことで値が更新されたら自動的に
        // didSet の部分が実行される
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = datas[indexPath.row]
        
        return cell
    }
}
