import UIKit
import CSSimpleSideMenu

class ThirdViewController: UIViewController {
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Actions
    
    @IBAction func showMenu(_ sender: Any) {
        SideMenu.toggle()
    }
    
    
}

