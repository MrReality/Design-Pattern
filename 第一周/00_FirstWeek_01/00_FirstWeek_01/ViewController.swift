//
//  ViewController.swift
//  00_FirstWeek_01
//
//  Created by Mac on 2017/10/19.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// 输入框
    @IBOutlet var inputTF: UITextField!
    /// tip label
    @IBOutlet var tipLabel: UILabel!
    /// 百分比的值
    @IBOutlet var tipNumLabel: UILabel!
    /// 总数
    @IBOutlet var totalLabel: UILabel!
    /// 总数的值
    @IBOutlet var totalNumLabel: UILabel!
    /// slider
    @IBOutlet var slider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.inputTF.keyboardType = UIKeyboardTypeNumberPad
        self.inputTF.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

