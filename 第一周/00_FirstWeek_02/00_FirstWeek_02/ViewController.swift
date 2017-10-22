//
//  ViewController.swift
//  00_FirstWeek_02
//
//  Created by 刘入徵 on 2017/10/22.
//  Copyright © 2017年 Mix_Reality. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let nameArray = [["Aandi","Annie","Adiy","Another"],
                 ["bbab","Basi","bax,","baieo","byan"],
                 ["Cany","Cbcc","Cpop","Ciem"],
                 ["Dama","Dend","Dievie","Dissabe"],
                 ["Vist","Vim","ViewController","View"],
                 ["Xis","Xtt","Xax","Xaia"],];
    
    let subTitlteArray = ["A","B","C","D","V","X"]
    
    /// MARK: tableView dataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return nameArray.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let arr = nameArray[indexPath.section]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Mycell")
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Mycell")
            cell?.textLabel?.text = arr[indexPath.row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 30))
        label.text = subTitlteArray[section]
        label.backgroundColor = .orange;
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return subTitlteArray
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        tableView.scrollToRow(at: NSIndexPath.init(row: 0, section: index) as IndexPath, at: .top, animated: true)
        
        return index
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "通讯录"
        
        let tableView =  UITableView(frame: self.view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
    }



}

