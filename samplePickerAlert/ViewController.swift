//
//  ViewController.swift
//  samplePickerAlert
//
//  Created by 小林由知 on 2017/10/25.
//  Copyright © 2017年 Yoshitomo Kobatashi. All rights reserved.
//

import UIKit

//1.プロトコル（手段、特定の部品を操る能力）をクラスに追加
class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var myPickerView: UIPickerView!
    
    //データを配列で用意する（メンバ変数）
    var teaList = ["ダージリン","アールエイ","アッサム","オレンジペコ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teaList.append("オレンチコバ")
        
        //5.指示を出しているのがViewComtrollerだと知らせる設置
        // self : 自分自身（ViewControllerのこと）
        //データソース（表示するデータの設定指示する人）
        myPickerView.dataSource = self
        
        //デリート（感知したイベントを委任する人、代理人（店長））
        myPickerView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //2.ピッカービューの列数を決定する。
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //1列に指定
    }
    
    //3.ピッカービューの行数を決定する。
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teaList.count //項目数に合わせた行数を指定
    //return 4 //4行に指定

    }
    
    //4.ピッカービューに表示する文字の設定
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //今ピッカービューが何行目のデータを作ろうとしているのか
        return teaList[row]
    }
    
    //6.選択された項目をデバックエリアに表示
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //row:選択さえれた項目が何行目か
        print(teaList[row])
        
        //部品となるアラート作成
        let alert = UIAlertController(title: "紅茶の選択", message: "これでよろしいですか？", preferredStyle: .alert)
        
        //アラートにOKボタンを追加
        //handler : OKボタンが押された時に、行いたい処理に指定する場所
        //alert.addAction(UIAlertAction(title: "OPPAI", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in print("OKが押されました。")}))
        
        //アラートの表示
        //completion: 動作が完了した後に発動される処理を指示
        //present(alert, animated: true, completion: nil)
        present(alert, animated: true, completion: {() -> Void in print("選択処理を完了します。")})
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

