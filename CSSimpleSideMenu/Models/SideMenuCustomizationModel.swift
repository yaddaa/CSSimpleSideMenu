import UIKit

public class SideMenuCustomizationModel {
    
    //view
    public var backgroundColor: UIColor = #colorLiteral(red: 0.2091190815, green: 0.2510499954, blue: 0.3111889064, alpha: 1)
    public var backgroundImage: UIImage? = nil
    
    //items
    public var menuItemsSelectedColor: UIColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.1)
    public var menuItemsFont: UIFont = .boldSystemFont(ofSize: 17)
    public var menuItemsTitleColor: UIColor = .white
    public var menuItemsHeight: CGFloat = 64
    
    //main
    public var position: SideMenuEnums.Position = .left
    
    public init() {}
    
}
