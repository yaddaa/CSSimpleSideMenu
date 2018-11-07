import UIKit

extension UIViewController {
    
    class func instance() -> Self {
        return instantiateFromStoryboardHelper()
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>() -> T {        
        let storyboard = UIStoryboard(name: String(describing: self), bundle: Bundle.podBundle(for: self))
        let identifier = String(describing: self)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! T
        return controller
    }
    
}
