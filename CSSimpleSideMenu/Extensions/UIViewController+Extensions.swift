import UIKit

extension UIViewController {
    
    static func instance() -> Self {
        return instantiateFromStoryboardHelper()
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>() -> T {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: Bundle(for: self))
        let identifier = String(describing: self)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! T
        return controller
    }
    
}
