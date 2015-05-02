//
//  ViewController.swift
//  fatFight
//
//  Created by zhuxiaowei on 15/4/23.
//  Copyright (c) 2015年 zhuxiaowei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var rateOfProgress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //如果没有设定目标跳转到设定目标视图
        if(!userDefaults.boolForKey("haveGoal")) {
            if let setGoalViewController = self.storyboard?.instantiateViewControllerWithIdentifier("setGoalViewController") as? UIViewController {
                self.showViewController(setGoalViewController, sender: self)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        updateRateOfProgress()
    }
    
    /* 放弃目标 */
    @IBAction func giveUp(sender: UIButton) {
        /* 移除所有的参数 */
        userDefaults.removeObjectForKey("goal")
        userDefaults.removeObjectForKey("startWeight")
        userDefaults.removeObjectForKey("currentWeight")
        userDefaults.setBool(false, forKey: "haveGoal")
    }
    
    /* 更新减肥进度 */
    func updateRateOfProgress() {
        var rate:Double = 0
        var goal = userDefaults.doubleForKey("goal")
        var startWeight = userDefaults.doubleForKey("startWeight")
        var currentWeight = userDefaults.doubleForKey("currentWeight")
        
        if(goal > 0 && startWeight > 0 && currentWeight > 0) {
            if(currentWeight >= startWeight) {
                rate = 0
            } else if(currentWeight <= goal) {
                rate = 100
            } else {
                rate = (startWeight - currentWeight) / (startWeight - goal) * 100
            }
        }
    
        rateOfProgress.text = String(format:"%.1f",rate) + "%";
    }

}

