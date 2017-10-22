//
//  ContinentModel.swift
//  ThreeRankTable
//
//  Created by 王涛 on 2017/10/17.
//  Copyright © 2017年 winsanity. All rights reserved.
//

import Foundation

class ContinentModel: NSObject {
    var conturies: [ConturyModel]?
    var name:String?
    var isOpen:Bool = true
    
    init(conturies: [ConturyModel], name: String) {
        super.init()
        self.conturies = conturies
        self.name = name
    }
    
    func pullOrDown() {
        isOpen = !isOpen
    }
    
}

class ConturyModel: NSObject {
    var provinces:[String]?
    var name:String?
    var isOpen:Bool = false
    
    init(provinces: [String], name: String) {
        super.init()
        self.provinces = provinces
        self.name = name
    }
    
    func pullOrDown() {
        isOpen = !isOpen
    }
    
    
}
