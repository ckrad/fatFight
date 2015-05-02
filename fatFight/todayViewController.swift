import UIKit

class todayViewController: UIViewController {
    
    var userDefaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var todayWeight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        var weight = (todayWeight.text as NSString).doubleValue
        
        if(weight <= 0) {
            showErrorAlert("体重不可以小于0")
            return false
        }
        
        userDefaults.setDouble(weight, forKey: "currentWeight")
        
        return true
    }
}

