//
//  ViewController.swift
//  StopWatch
//
//  Created by 曽根大輔 on 2018/02/05.
//  Copyright © 2018年 曽根大輔. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    //ラベルの宣言
    @IBOutlet var Label: UILabel!
    //判定ラベルの宣言
    @IBOutlet var hanteiLabel: UILabel!
    
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hanteiLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func up(){
        //countを0.01(経過時間分)足す
        count = count + 0.01
        //ラベルに小数点0.01以下まで表示
        Label.text = String(format: "%.2f",count)
        
    }
   
    @IBAction func start(){
        if !timer.isValid{
            //タイマーが動いていなかったら動かす
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true)
                          }
        
    }
    
    @IBAction func Reset() {
        self.stop()
        
        //タイマーを初期化
        count = 0.0
        //ラベルに表示
        Label.text = String(format: "%.2f",count)
        
        hanteiLabel.text  = ""
    }
    
    @IBAction func stop(){
        
        if timer.isValid{
            
            //タイマーが動作していたら停止する
           timer.invalidate()
            
           
        
        }
        self.hantei()
        
    }
    
    //判定するメソッドの生成
    func hantei(){
        
        if count > 9.80 && count < 10.20 {
            
            hanteiLabel.text = "Perfect"
            
        } else if count > 9.70 && count < 10.30 {
            
            hanteiLabel.text  = "Good"
        } else {
            hanteiLabel.text  = "Bad"
        }
    }


}

