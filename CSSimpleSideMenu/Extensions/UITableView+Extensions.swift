import UIKit

extension UITableView {
    /** Register a NIB-Based `UITableViewCell` subclass (conforming to `NibReusable`) */
    final func registerReusableCell<T: UITableViewCell>(cellType: T.Type) where T: NibReusable {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}

