//
//  SectionHeader.swift
//  ThreeRankTable
//
//  Created by 王涛 on 2017/10/17.
//  Copyright © 2017年 winsanity. All rights reserved.
//

import UIKit

protocol SectionDelegate {
    
    func showOrHideContient(index: Int)
    
}


class SectionHeader: UIView {

    var delegate: SectionDelegate?
    var index: Int?
    
    init(frame: CGRect, contient: ContinentModel, index: NSInteger) {
        super.init(frame: frame)
        
        self.index = index
        
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.text = contient.name!
        label.font = UIFont.systemFont(ofSize: 20)
        addSubview(label)
        
        let showButton = UIButton.init(type: .custom)
        showButton.frame = CGRect(x: UIScreen.main.bounds.size.width - 60, y: 5, width: 40, height: 40)
        showButton.addTarget(self, action: #selector(showOrHide(sender:)), for: .touchUpInside)
        
        showButton.setImage(UIImage.init(named: contient.isOpen ? "remove" : "add" ), for: .normal)
        addSubview(showButton)
        
        backgroundColor = UIColor.brown
        
    }
    
    @objc func showOrHide(sender: UIButton){
        
        if (delegate != nil) {
            delegate?.showOrHideContient(index: self.index!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
