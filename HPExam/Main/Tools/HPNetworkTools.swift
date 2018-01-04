//
//  HPNetworkTools.swift
//  HPExam
//
//  Created by 雅风 on 2017/12/6.
//  Copyright © 2017年 yafeng. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HPNetworkTools: NSObject {
    //登录获取信息
    func loadUserInfo(number:String,password:String){
        let parameters : [String : Any] = ["number": number,
                                           "password": password]
        let url = "http://120.78.65.137:8080/exam/person/login"
        let str_utf = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        //1,responseJSON
        Alamofire.request(str_utf!, method: .get, parameters: parameters).responseJSON { (response) in
            print("GET_Request --> GET 请求 --> returnResult = \(response)")
            
            if let value = response.result.value {
                print("firstMethod --> responseJSON --> \(value)")
                let dict = JSON(value)
                
                /*  返回请求地址、数据、和状态结果等信息
                 print("firstMethod --> responseJSON() --> \(returnResult.request!)")
                 print("firstMethod --> responseJSON() --> \(returnResult.data!)")
                 print("firstMethod --> responseJSON() --> \(returnResult.result)")
                 */
                
                let data = dict["person"].dictionary
                print(data)
                if let persons = dict["person"].arrayObject{
                    var userInfoes = [UserInfo]()
                    for person in persons{
                        let userInfo = UserInfo(dict: person as![String:AnyObject])
                        userInfoes.append(userInfo)
                        print(userInfoes)
                    }
                }
                let state = dict["result"].stringValue
                print("state",state)
                if(state == "success"){
                    print("发送通知")
                    let notificationName = Notification.Name(rawValue: "LoginSuccess")
                    NotificationCenter.default.post(name: notificationName, object: self,
                                                    userInfo: ["value1":"hangge.com", "value2" : 12345])
                    print("通知完毕")
                }
                
            }
        }
    }
    func getRegister(number:String,password:String,name:String,age:Int,sex:String)  {
        
        let parameters : [String : Any] = ["name":name,
                                           "age":age,
                                           "password": password,
                                           "number": number,
                                           "sex":sex]
        let url = "http://120.78.65.137:8080/exam/person/save"
        let str_utf = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        //1,responseJSON
        Alamofire.request(str_utf!, method: .get, parameters: parameters).responseJSON { (response) in
            print("GET_Request --> GET 请求 --> returnResult = \(response)")
            
            if let value = response.result.value {
                print("firstMethod --> responseJSON --> \(value)")
                let dict = JSON(value)
                
                let data = dict["result"]
                //If not a String or nil, return ""
                let state = JSON(data).stringValue
                print(state)
                if(state == "success"){
                    print("发送通知")
                    let notificationName = Notification.Name(rawValue: "RegisterSuccess")
                    NotificationCenter.default.post(name: notificationName, object: self,
                                                    userInfo: ["value1":"hangge.com", "value2" : 12345])
                    print("通知完毕")
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    


