//
//  untilies.swift
//  fatFight
//
//  Created by zhuxiaowei on 15/5/2.
//  Copyright (c) 2015年 zhuxiaowei. All rights reserved.
//

import UIKit

func showErrorAlert(msg: String) {
    let alert = UIAlertView()
    
    alert.title = "错误"
    alert.message = msg
    alert.addButtonWithTitle("确定")
    alert.show()
}
