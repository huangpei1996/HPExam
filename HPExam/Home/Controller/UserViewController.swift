//
//  UserViewController.swift
//  HPExam
//
//  Created by 雅风 on 2017/12/12.
//  Copyright © 2017年 yafeng. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBAction func bt_Person(_ sender: Any) {
        let mystroyBoard = self.storyboard
        
        let anotherView:UIViewController = (mystroyBoard?.instantiateViewController(withIdentifier: "Person"))! as
        UIViewController
        
        self.present(anotherView,animated: true, completion: nil)
    }
    @IBAction func bt_Answer(_ sender: Any) {
        let mystroyBoard = self.storyboard
        
        let anotherView:UIViewController = (mystroyBoard?.instantiateViewController(withIdentifier: "Answer"))! as
        UIViewController
        
        self.present(anotherView,animated: true, completion: nil)
    }
    @IBAction func bt_Feedback(_ sender: Any) {
        let mystroyBoard = self.storyboard
        
        let anotherView:UIViewController = (mystroyBoard?.instantiateViewController(withIdentifier: "Feedback"))! as
        UIViewController
        
        self.present(anotherView,animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
