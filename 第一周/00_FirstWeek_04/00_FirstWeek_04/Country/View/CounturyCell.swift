//
//  CounturyCell.swift
//  ThreeRankTable
//
//  Created by 王涛 on 2017/10/17.
//  Copyright © 2017年 winsanity. All rights reserved.
//

import UIKit

protocol CountryCellDelegate {
    func showOrHideCountry(indexPath: NSIndexPath)
}


class CounturyCell: UITableViewCell {
    
    var m_delegate: CountryCellDelegate?
    
    var indexPath: NSIndexPath?
    var cityView: UIView?
    var showAll:Bool?

    
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, country: ConturyModel, indexPath: NSIndexPath) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.showAll = country.isOpen
        self.indexPath = indexPath
        
        let nameView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
        nameView.backgroundColor = UIColor.gray
        
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 40))
        label.text = country.name
        nameView.addSubview(label)
        
        let showButton = UIButton.init(type: .custom)
        showButton.frame = CGRect(x: UIScreen.main.bounds.size.width - 60, y: 5, width: 40, height: 40)
        showButton.addTarget(self, action: #selector(showOrHide(sender:)), for: .touchUpInside)
        
        showButton.setImage(UIImage.init(named: country.isOpen ? "down" : "right" ), for: .normal)
        showButton.backgroundColor = UIColor.clear
        nameView.addSubview(showButton)
        
        contentView.addSubview(nameView)
        
    
        cityView = UIView(frame: CGRect(x: 0, y: 40, width: Int(UIScreen.main.bounds.size.width), height: (country.provinces?.count)! * 40))
        cityView?.isHidden = !showAll!
        
        for count: Int in 0...((country.provinces?.count)! - 1) {
            
            let label = UILabel(frame: CGRect(x: 40, y: 40 * count, width: Int(bounds.size.width), height: 40))
            label.text = country.provinces![count]
            cityView?.addSubview(label)
        }
        
        contentView.addSubview(cityView!)
        
    }
    
    @objc func showOrHide(sender: UIButton) {
        
   
    
        if (m_delegate != nil) {
            m_delegate?.showOrHideCountry(indexPath: self.indexPath!)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
