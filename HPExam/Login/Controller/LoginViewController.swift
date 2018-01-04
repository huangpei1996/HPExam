//
//  LoginViewController.swift
//  HPExam
//
//  Created by 雅风 on 2017/12/6.
//  Copyright © 2017年 yafeng. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    //手机号码输入框
    @IBOutlet weak var tf_loginPhone: UITextField!
    //密码输入框
    @IBOutlet weak var tf_loginPassWord: UITextField!
    //登录按钮
    @IBAction func bt_Login(_ sender: Any) {
        var number = tf_loginPhone.text
        var password = tf_loginPassWord.text
        if(number?.isEmpty)!{
            alert(message: "您的账号为空")
        }else if(password?.isEmpty)!{
            alert(message: "您的密码为空")
        }else{
            SVProgressHUD.show()
            var net = HPNetworkTools()
            net.loadUserInfo(number:number!,password: password!)
            let notificationName = Notification.Name(rawValue: "LoginSuccess")
            NotificationCenter.default.addObserver(self, selector:#selector(toHome(notification:)),
                                                   name: notificationName, object: nil)
        }
        
        
        
        
    }
    //跳转到注册按钮
    @IBAction func bt_loginRegister(_ sender: Any) {
        toRegister()
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    //跳转到注册界面
    func toRegister() {
        
        let mystroyBoard = self.storyboard
        let anotherBoard = UIStoryboard(name: "Register", bundle: nil)
        
        let anotherView:UIViewController = (anotherBoard.instantiateViewController(withIdentifier: "Register")) as
        UIViewController
        
        self.present(anotherView,animated: true, completion: nil)
    }
    //跳转到主界面
    @objc func toHome(notification: Notification) {
        SVProgressHUD.showSuccess(withStatus: "登录成功")
        print("跳转")
        let mystroyBoard = self.storyboard
        let anotherBoard = UIStoryboard(name: "Home", bundle: nil)
        
        let anotherView:UIViewController = (anotherBoard.instantiateViewController(withIdentifier: "Home")) as
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
    

    

}
