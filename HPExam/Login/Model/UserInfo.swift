//
//  UserInfo.swift
//  HPExam
//
//  Created by 雅风 on 2017/12/6.
//  Copyright © 2017年 yafeng. All rights reserved.
//

import UIKit

class UserInfo: NSObject {
    var id:Int?
    
    var number:String?
    
    var password:String?
    
    var oldPassword:String?
    
    var name:String?
    
    var age:Int?
    
    var sex:String?
    
    var token:String?
    
    init(dict: [String:AnyObject]) {
        super.init()
        id = dict["id"] as? Int
        number = dict["number"] as? String
        password = dict["password"] as? String
        oldPassword = dict["oldPassword"] as? String
        name = dict["name"] as? String
        age = dict["age"] as? Int
        sex = dict["sex"] as? String
        token = dict["token"] as? String
        
        
        
        
        
    }
    
    
    

}
