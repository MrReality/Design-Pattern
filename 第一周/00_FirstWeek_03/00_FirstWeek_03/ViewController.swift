//
//  ViewController.swift
//  00_FirstWeek_03
//
//  Created by 刘入徵 on 2017/10/22.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var label: UILabel!
    var timer: Timer!
    var currentTime : Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "0.0"
        currentTime = 0
    }
    
    /// MARK: 清空按钮
    @IBAction func restAction(_ sender: Any) {
    
        label.text = "0.0"
        currentTime = 0
        if(timer != nil){
            timer?.invalidate()
            timer = nil
        }
    }
    
    /// MARK: 开始
    @IBAction func startAction(_ sender: Any) {
        if(timer == nil){
            timer = Timer(timeInterval: 0.1, target: self, selector: #selector(test), userInfo: nil, repeats: true)
            RunLoop.current.add(timer, forMode: .commonModes)
        } else {
            timer?.fire()
        }
    }
    
    
    @IBAction func endAction(_ sender: Any) {
        if(timer == nil){
            return
        }
        timer?.invalidate()
        timer = nil
    }
    
    @objc func test() -> Void {
        currentTime = Float(currentTime) + 0.1
        label.text = "\(currentTime!)"
    }
}

