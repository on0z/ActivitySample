import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myButton.addTarget(self, action: #selector(ViewController.mybuttonAction(_:)), for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mybuttonAction(_ sender: UIButton){
        let shareText: String = "Google"
        let shareURL: URL = URL(string: "https://www.google.com")!
        let myActivity: UIActivityViewController = UIActivityViewController(activityItems: [shareText, shareURL], applicationActivities: [myActivity1(), myActivity2()])
        myActivity.popoverPresentationController?.sourceView = sender
        self.present(myActivity, animated: true, completion: nil)
    }
    
}

class myActivity1: UIActivity {
    override var activityType: String? {
        return "com.sample.ActivitySample"
    }
    override var activityTitle:String? {
        return "ActionSample1"
    }
    override func canPerform(withActivityItems activityItems: [AnyObject]) -> Bool {
        for activityItem in activityItems{
            if activityItem is URL{
                return true
            }
        }
        return false
    }
    override func prepare(withActivityItems activityItems: [AnyObject]) {
        for activityItem in activityItems{
            if activityItem is URL{
                if let url: URL = activityItem as? URL{
                    if UIApplication.shared.canOpenURL(url){
                        UIApplication.shared.openURL(url)
                    }
                }
            }
        }
    }
}

class myActivity2: UIActivity {
    override var activityType: String? {
        return "com.sample.ActivitySample"
    }
    override var activityTitle: String? {
        return "ActionSample2"
    }
    override func canPerform(withActivityItems activityItems: [AnyObject]) -> Bool {
        for activityItem in activityItems{
            if activityItem is URL{
                return true
            }
        }
        return false
    }
    override func prepare(withActivityItems activityItems: [AnyObject]) {
        for activityItem in activityItems{
            if activityItem is URL{
                if let url: URL = activityItem as? URL{
                    if UIApplication.shared.canOpenURL(url){
                        UIApplication.shared.openURL(url)
                    }
                }
            }
        }
    }
}
