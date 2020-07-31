//
//  ViewController.swift
//  Antiqueapp
//
//  Created by user on 2020/07/31.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var fashionCollection: UICollectionView!
    //画像の名前の配列
    var images = ["1","2","3","4","5","6","7","8","9","10","11","12","13"]
       
    //値段の配列
    var prices = ["¥7800","¥23,000","¥36,000","¥4500","¥9650","¥6700","¥7500","¥9800","¥29,000","¥10,600","¥11,000","¥3120","¥1350"]
       
    //ブランド名の配列
    var brands = ["Patagonia","A BATHING APE","nano・universe","green label relaxing","antiqua","Tommorowland","Felissimo","Aula","Bal","Fred Perry","Grandier","HUGO","Jackman"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //追加分
        self.fashionCollection.delegate = self
        self.fashionCollection.dataSource = self
        
    }
    //セルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    //セクション数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //各VIEWの表示
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //①
        let cell = self.fashionCollection.dequeueReusableCell(withReuseIdentifier: "Fashion", for: indexPath) as! CollectionViewCell
        //②
        cell.mainImage.image = UIImage(named: self.images[indexPath.row])
        //③
        cell.priceLabel.text = self.prices[indexPath.row]
        //④
        cell.brandLabel.text = self.brands[indexPath.row]
        cell.ImagewidthController.constant = UIScreen.main.bounds.width/3-20
        cell.Imageheightcontrller.constant = 150
        //⑤
        return cell
    }
    //セルのサイズ
/*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
               return CGSize(width: UIScreen.main.bounds.width/3-20, height: 200)

    }*/
}

