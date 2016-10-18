//
//  ViewController.swift
//  sampleDragApp
//
//  Created by Muneharu Onoue on 2016/10/18.
//  Copyright © 2016年 Muneharu Onoue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 画面タッチ開始
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("Touch Start")
        
    }
    
    //　ドラッグ時に呼ばれる
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // タッチイベント取得
        let touch = touches.first!
        
        // ドラッグ前の位置
        let beforeX = touch.previousLocation(in: self.view).x
        let beforeY = touch.previousLocation(in: self.view).y
        
        // ドラッグ後の位置
        let afterX = touch.location(in: self.view).x
        let afterY = touch.location(in: self.view).y
        
        // ドラッグしたx座標の移動距離
        let farX = afterX - beforeX
        
        // ドラッグしたy座標の移動距離
        let farY = afterY - beforeY
        
        // 画像の座標取得
        var viewFrame = myImageView.frame
        
        // 移動分を反映させる
        viewFrame.origin.x += farX
        viewFrame.origin.y += farY
        
        myImageView.frame = viewFrame
    }
    
    // 画面タッチ終了
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("Touch End")
    }


}

