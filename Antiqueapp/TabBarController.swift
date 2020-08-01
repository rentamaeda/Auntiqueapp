//
//  TabBarController.swift
//  Antiqueapp
//
//  Created by user on 2020/07/31.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import Firebase // 先頭でFirebaseをimportしておく
import FirebaseAuth
class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)

           // currentUserがnilならログインしていない
           if Auth.auth().currentUser == nil {
               // ログインしていないときの処理
               let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
               self.present(loginViewController!, animated: true, completion: nil)
           }
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
