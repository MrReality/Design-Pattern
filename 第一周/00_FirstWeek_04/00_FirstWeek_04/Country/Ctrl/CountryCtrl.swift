//
//  CountryCtrl.swift
//  00_FirstWeek_04
//
//  Created by 刘入徵 on 2017/10/22.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

import UIKit

class CountryCtrl: UIViewController,UITableViewDelegate,UITableViewDataSource,SectionDelegate,CountryCellDelegate {

    
    var contients: [ContinentModel] = []
    var tableView: UITableView?
    
    let continent1 = ContinentModel(conturies: [ConturyModel.init(provinces: ["北京","上海","广州","深圳"], name: "中国"), ConturyModel.init(provinces: ["莫斯科","圣彼得堡","西伯利亚"], name: "俄罗斯")], name: "亚洲")
    let continent2 = ContinentModel(conturies: [ConturyModel.init(provinces: ["圣保罗","里约热内卢","巴西利亚"], name: "巴西"), ConturyModel.init(provinces: ["门多萨","科尔多瓦"], name: "阿根廷")], name: "南美洲")
    
    let continent3 = ContinentModel(conturies: [ConturyModel.init(provinces: ["悉尼","墨尔本","堪培拉"], name: "澳大利亚"), ConturyModel.init(provinces: ["奥克兰","皇后镇","惠灵顿"], name: "新西兰")], name: "澳洲")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contients = [continent1, continent2, continent3]
        
        tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
    }
    
    
    //MARK: tableView delegate and datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return contients.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  contients[section].isOpen ?    (contients[section].conturies?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let contury = contients[indexPath.section].conturies![indexPath.row]
        
        return CGFloat(contury.isOpen ? 40 + (contury.provinces?.count)! * 40 : 40)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 50)
        
        let sectionHeader = SectionHeader(frame: frame, contient: contients[section], index: section)
        sectionHeader.delegate = self
        
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let country = contients[indexPath.section].conturies![indexPath.row]
        let  cell = CounturyCell(style: .default, reuseIdentifier: "MyCell", country: country, indexPath: indexPath as NSIndexPath)
        
        cell.m_delegate = self
        return cell
    }
    
    
    func showOrHideContient(index: NSInteger) {
        contients[index].isOpen = !contients[index].isOpen
        
        tableView?.reloadSections(IndexSet.init(integer: index), with: .fade)
        
    }
    
    func showOrHideCountry(indexPath: NSIndexPath) {
        
        contients[indexPath.section].conturies![indexPath.row].isOpen = !contients[indexPath.section].conturies![indexPath.row].isOpen
        tableView?.reloadRows(at: [indexPath as IndexPath], with: .fade)
    }
}
