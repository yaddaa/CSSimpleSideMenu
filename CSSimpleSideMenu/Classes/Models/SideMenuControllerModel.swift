import UIKit

public class SideMenuControllerModel {
    
    let viewController: UIViewController
    let visibleName: String
    
    public init(with controller: UIViewController, name: String) {
        viewController = controller
        visibleName = name
    }
    
}
