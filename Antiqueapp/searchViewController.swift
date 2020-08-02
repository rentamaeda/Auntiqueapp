//
//  searchViewController.swift
//  Antiqueapp
//
//  Created by user on 2020/07/31.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import Firebase



class searchViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var images = ["1","2","3","4","5","6","7","8","9","10","11","12","13"]
    var searchResult: Array<String> = []

       //値段の配列
       var prices = ["¥7800","¥23,000","¥36,000","¥4500","¥9650","¥6700","¥7500","¥9800","¥29,000","¥10,600","¥11,000","¥3120","¥1350"]
          
       //ブランド名の配列
       var brands = ["Patagonia","A BATHING APE","nano・universe","green label relaxing","antiqua","Tommorowland","Felissimo","Aula","Bal","Fred Perry","Grandier","HUGO","Jackman"]

    //検索結果を入れる配列
    var searchArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //追加分
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.navigationController?.navigationBar.shadowImage = UIImage()

        //サーチの設定
        searchBar.delegate = self
        searchResult = brands

        collectionView.reloadData()

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
           let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "Fashion", for: indexPath) as! searchCollectionViewCell
           //②
           cell.ImageView.image = UIImage(named: self.images[indexPath.row])
           //③
           cell.priceLabel.text = self.prices[indexPath.row]
           //④
           cell.brandLabel.text = self.brands[indexPath.row]
           cell.widtthController.constant = UIScreen.main.bounds.width/3-20
           cell.heightController.constant = 150
           //⑤
           return cell
       }
    //以下searchbar
    // 検索バー編集開始時にキャンセルボタン有効化
       func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
           searchBar.setShowsCancelButton(true, animated: true)
       }

       // キャンセルボタンでキャセルボタン非表示
       func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           searchBar.resignFirstResponder()
           searchBar.setShowsCancelButton(false, animated: true)
        collectionView.reloadData()

       }

       // エンターキーで検索
       func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
           searchBar.resignFirstResponder()
           searchBar.setShowsCancelButton(false, animated: true)
           print(searchBar.text! as String)
        searchItems(searchText: searchBar.text!
        )

       
           }
    
    func searchItems(searchText: String) {
        //brands = brands.filter(brands == "%@", searchBar.text)
        if searchBar.text != "" {
            searchResult = brands.filter({$0 == searchBar.text})
                   }else {
                   //渡された文字列が空の場合は全てを表示
                   brands = searchResult
               }
               //tableViewを再読み込みする
        collectionView.reloadData()
    }
    //検索結果を表示
   /* func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           //要素を検索する
           if searchText != "" {
               searchedArray = brands.filter { myItem in
                   return (myItem[1]).contains(searchText)
               } as Array<Array<String>>

           } else {
               //渡された文字列が空の場合は全てを表示
               searchedArray = brands
           }
           //再読み込みする
           collectionView.reloadData()
        
    }*/
   
}
