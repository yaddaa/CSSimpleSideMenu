import UIKit

public class SideMenuCustomizationModel {
    
    // background side menu settings
    // you can set just background colod
    public var backgroundColor: UIColor = UIColor(red: 0.209, green: 0.251, blue: 0.311, alpha: 1)
    
    // or background image
    public var backgroundImage: UIImage? = nil
    
    //customize items
    // background color for selected item
    public var menuItemsSelectedColor: UIColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.1)
    
    public var menuItemsFont: UIFont = .boldSystemFont(ofSize: 17)
    
    public var menuItemsTitleColor: UIColor = .white
    
    public var menuItemsHeight: CGFloat = 62
    
    //top and bottom images of menu
    public var topImage: UIImage? = nil
    
    public var bottomImage: UIImage? = nil
    
    public var imagesContentMode: UIViewContentMode  = .scaleAspectFit

    public var bottomImageHeight: CGFloat = 0
    
    // top offset for menu items depends on this property
    public var topImageHeight: CGFloat = UIScreen.main.bounds.height * 0.25
    
    // set .left or .right side menu position
    public var position: SideMenuEnums.Position = .left
    
    public init() {}
    
}
