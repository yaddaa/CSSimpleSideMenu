import UIKit

extension UIViewController {
    
    class func instanceInitial() -> Self {
        return instantiateFromStoryboardHelper()
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>() -> T {        
        let storyboard = UIStoryboard(name: String(describing: self), bundle: Bundle.podBundle(for: self))
        let controller = storyboard.instantiateInitialViewController() as! T
        return controller
    }
    
}
