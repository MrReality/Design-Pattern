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
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        
        inputTF.keyboardType = .numberPad
        if((inputTF.text?.isEmpty)! == false){
            inputTF.text = "0"
        }
        slider.addTarget(self, action: #selector(sliderAction(slider:)), for: .valueChanged)
//        inputTF.delegate = self
    }
    
    /// MARK: 计算结果
    func resultAction(){

        let input = NSDecimalNumber(string: inputTF.text)
        /// tip
        let persent = slider.value * 100
        /// tip 值
        let persentValue = input.floatValue * slider.value
        tipLabel.text = "Tip(\(persent)%)"
        tipNumLabel.text = "\(persentValue)"
        totalNumLabel.text = "$\(persentValue + input.floatValue)"
    }
    
    @objc func sliderAction(slider : UISlider) -> Void {
        resultAction()
    }

    @IBAction func sliderAction(_ sender: Any) {
//        resultAction()
    }
    @IBAction func inputAction(_ sender: Any) {
        resultAction()
    }
    

}

