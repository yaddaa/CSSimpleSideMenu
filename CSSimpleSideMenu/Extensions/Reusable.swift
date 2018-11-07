import UIKit

protocol Reusable: class {
    
    static var reuseIdentifier: String { get }
    
}

extension Reusable {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

protocol NibReusable: Reusable, NibLoadable {}

protocol NibLoadable: class {
    
    static var nib: UINib { get }
    static var nibName: String { get }
    
}

extension NibLoadable {
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle.podBundle(for: self))
    }
    
    static var nibName: String {
        return String(describing: self)
    }
    
}

extension NibLoadable where Self: UIView {
    /**
     Returns a `UIView` object instantiated from nib
     
     - returns: A `NibLoadable`, `UIView` instance
     */
    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        
        return view
    }
    
}

