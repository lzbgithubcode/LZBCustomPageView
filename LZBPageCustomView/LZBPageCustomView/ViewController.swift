//
//  ViewController.swift
//  LZBPageCustomView
//
//  Created by zibin on 2017/5/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

private let kPageCollectionVeiwCellID = "kPageCollectionVeiwCellID"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.frame
        let frame = CGRect(x: 0, y: 100, width:view.bounds.width, height: 300)
        
        //2.标题
        let titles = ["提姆","火蓝","球女","发条"]
        
        //3.样式
        var model = LZBPageStyleModel()
        model.isShowBottomLine = true
        
        //4.布局
        let layout = LZBCollectionLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .horizontal
        layout.cols = 7
        layout.rows = 3
        
        let pageView  = LZBPageCollectionVeiw(frame: frame, titles: titles, style: model, layout: layout)
        pageView.dataSoure = self
        pageView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kPageCollectionVeiwCellID)
        
         self.view.addSubview(pageView)
    }
}



extension ViewController :  LZBPageCollectionVeiwDataSoure{
  
    func numberOfSections(in pageCollectionVeiw: LZBPageCollectionVeiw) -> Int {
         return  4
    }
    
    func pageCollectionVeiw(_ pageCollectionVeiw: LZBPageCollectionVeiw, numberOfItemsInSection section: Int) -> Int {
        var count = 0
        switch section {
        case 0:
            count = 15
        case 1:
            count = 25
        case 2:
            count = 35
        case 3:
           count = 7
        default:
          count = 30
        }
        return count
    }
    
    func pageCollectionVeiw(_ pageCollectionVeiw: LZBPageCollectionVeiw, _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPageCollectionVeiwCellID, for: indexPath)
        cell.backgroundColor = UIColor.getRandomColor()
        return cell 
    }
}
