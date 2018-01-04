//
//  RegisterViewController.swift
//  HPExam
//
//  Created by 雅风 on 2017/12/6.
//  Copyright © 2017年 yafeng. All rights reserved.
//

import UIKit
import SVProgressHUD

class RegisterViewController: UIViewController {
    var sex = ""
    var state = ""
    
    
    
    @IBOutlet weak var bt_registerGirl: UIButton!
    @IBOutlet weak var bt_registerBoy: UIButton!
    @IBOutlet weak var tf_registerNum: UITextField!
    @IBOutlet weak var tf_registerPassword: UITextField!
    @IBOutlet weak var tf_registerPassword_2: UITextField!
    @IBOutlet weak var tf_registerName: UITextField!
    @IBOutlet weak var tf_registerAge: UITextField!
    
    @IBAction func bt_registerBoy(_ sender: Any) {
        sex = "男"
        
        bt_registerBoy.setTitleColor(UIColor.blue, for: .normal)
        bt_registerGirl.setTitleColor(UIColor.lightGray, for: .normal)
        
    }
    
    @IBAction func bt_registerGirl(_ sender: Any) {
        sex = "女"
        bt_registerGirl.setTitleColor(UIColor.blue, for: .normal)
        bt_registerBoy.setTitleColor(UIColor.lightGray, for: .normal)
    }
    @IBAction func bt_Register(_ sender: Any) {
        
        var net = HPNetworkTools()
        if (tf_registerNum.text?.isEmpty)! {
            alert(message: "你的账号为空")
        }else if(tf_registerPassword.text?.isEmpty)!{
            alert(message: "您的密码为空")
        }else if(tf_registerPassword.text != tf_registerPassword_2.text){
            alert(message: "您两次输入的密码不同")
        }else if(tf_registerName.text?.isEmpty)!{
            alert(message: "您的昵称为空")
        }else if(tf_registerAge.text?.isEmpty)!{
            alert(message: "您未填写年龄")
        }else if(sex == ""){
            alert(message: "您的性别未选择")
        }else{
            SVProgressHUD.show(withStatus: "正在加载...")
            var number = tf_registerNum.text!
            var password = tf_registerPassword.text!
            var name = tf_registerName.text!
            var age = Int(self.tf_registerAge.text!)!
            
            net.getRegister(number: number, password: password, name: name, age: age, sex: self.sex)
            let notificationName = Notification.Name(rawValue: "RegisterSuccess")
            NotificationCenter.default.addObserver(self, selector:#selector(toLogin(notification:)),
                                                   name: notificationName, object: nil)
        }
       
    }
    @objc func toLogin(notification: Notification) {
        SVProgressHUD.showSuccess(withStatus: "注册成功")
        print("跳转")
        let mystroyBoard = self.storyboard
        let anotherBoard = UIStoryboard(name: "Login", bundle: nil)
        
        let anotherView:UIViewController = (anotherBoard.instantiateViewController(withIdentifier: "Login")) as
        UIViewController
        
        self.present(anotherView,animated: true, completion: nil)
        let userInfo = notification.userInfo as! [String: AnyObject]
        let value1 = userInfo["value1"] as! String
        let value2 = userInfo["value2"] as! Int
        
        print(" 获取到通知，用户数据是［\(value1),\(value2)］")
        
        
        
        print(" 执行完毕")
    }
    deinit{
        NotificationCenter.default.removeObserver(self)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func alert(message:String) {
        let alertController = UIAlertController(title: "系统提示",
                                                message: message, preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .default,
                                     handler: {
                                        action in
                                        
                                        
                                        
        })
//        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
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
