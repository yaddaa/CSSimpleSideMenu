import UIKit

extension UIViewController {
    
    class func instance() -> Self {
        return instantiateFromStoryboardHelper(String(describing: self))
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: Bundle(for: self))
        let identifier = String(describing: self)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! T
        return controller
    }
    
}
