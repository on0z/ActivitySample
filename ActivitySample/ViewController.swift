import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myButton.addTarget(self, action: #selector(ViewController.mybuttonAction(_:)), forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mybuttonAction(sender: UIButton){
        let shareText: String = "Google"
        let shareURL: NSURL = NSURL(string: "https://www.google.com")!
        let myActivity: UIActivityViewController = UIActivityViewController(activityItems: [shareText, shareURL], applicationActivities: [myActivity1(), myActivity2()])
        myActivity.popoverPresentationController?.sourceView = sender
        self.presentViewController(myActivity, animated: true, completion: nil)
    }
    
}

class myActivity1: UIActivity {
    override func activityType() -> String? {
        return "com.sample.ActivitySample"
    }
    override func activityTitle() -> String? {
        return "ActionSample1"
    }
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        for activityItem in activityItems{
            if activityItem.isKindOfClass(NSURL){
                return true
            }
        }
        return false
    }
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        for activityItem in activityItems{
            if activityItem.isKindOfClass(NSURL){
                if let url: NSURL = activityItem as? NSURL{
                    if UIApplication.sharedApplication().canOpenURL(url){
                        UIApplication.sharedApplication().openURL(url)
                    }
                }
            }
        }
    }
}

class myActivity2: UIActivity {
    override func activityType() -> String? {
        return "com.sample.ActivitySample"
    }
    override func activityTitle() -> String? {
        return "ActionSample2"
    }
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        for activityItem in activityItems{
            if activityItem.isKindOfClass(NSURL){
                return true
            }
        }
        return false
    }
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        for activityItem in activityItems{
            if activityItem.isKindOfClass(NSURL){
                if let url: NSURL = activityItem as? NSURL{
                    if UIApplication.sharedApplication().canOpenURL(url){
                        UIApplication.sharedApplication().openURL(url)
                    }
                }
            }
        }
    }
}
