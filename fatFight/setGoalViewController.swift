import UIKit

class setGoalViewController: UIViewController {
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var currentWeight: UITextField!
    
    @IBOutlet weak var goal: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setGoal(goalValue: Double, currentWeightValue: Double) {
        userDefaults.setDouble(goalValue, forKey: "goal")
        userDefaults.setDouble(currentWeightValue, forKey: "startWeight")
        userDefaults.setBool(true, forKey: "haveGoal")
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        var goalValue = (goal.text as NSString).doubleValue
        var currentWeightValue = (currentWeight.text as NSString).doubleValue
        
        if(goalValue <= 0) {
            showErrorAlert("目标体重必须大于0")
            return false
        }
        
        if(currentWeightValue <= 0) {
            showErrorAlert("当前体重必须大于0")
            return false
        }
        
        if(currentWeightValue < goalValue) {
            showErrorAlert("当前体重必须大于目标体重")
            return false
        }
        
        setGoal(goalValue, currentWeightValue: currentWeightValue)
        
        return true
    }
}

