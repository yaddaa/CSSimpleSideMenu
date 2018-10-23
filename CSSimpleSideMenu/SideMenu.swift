import UIKit

public class SideMenu {
    
    // MARK: - Properties
    
    internal var currentState: SideMenuEnums.MenuState = .showed
    internal var mainViewController = SideMenuViewController.instance()
    internal var models: [SideMenuControllerModel]!
    internal var customization: SideMenuCustomizationModel!
    internal static let shared = SideMenu()

    // MARK: - Public
    
    static public func toggle() {
        shared.currentState.toggle()
        
        switch shared.currentState {
        case .hidden: shared.mainViewController.showMenu()
        case .showed: shared.mainViewController.hideMenu()
        }
    }
    
    // MARK: - Configuration
    static public func congifure(with controllers: [SideMenuControllerModel], customization: SideMenuCustomizationModel?) {
        
        shared.models = controllers
        shared.customization = customization ?? SideMenuCustomizationModel()
        
        //set side menu as root controller in application window
        UIApplication.shared.delegate?.window??.rootViewController = shared.mainViewController
        UIApplication.shared.delegate?.window??.makeKeyAndVisible()
    }
    
}

// MARK: SideMenuConfiguration
extension SideMenu {
    
    static func configuration() -> SideMenuConfigurationModel {
        let names = shared.models.map({ $0.visibleName })
        let configuration = SideMenuConfigurationModel(visibleNames: names) { (index) in
            shared.didSelectViewController(index)
        }
        configuration.customization = shared.customization
        
        return configuration
    }
    
    static func firstControllerModel() -> SideMenuControllerModel?  {
        return shared.models.first
    }
    
    static func isLeftSideMenu() -> Bool {
        return shared.customization.position == .left
    }
}

// MARK: - SideMenuViewControllerDelegate
extension SideMenu: SideMenuViewControllerDelegate {
    
    internal func didSelectViewController(_ selectedIndex: Int) {
        mainViewController.setViewController(models[selectedIndex].viewController)
        hide()
    }
    
    internal func hide() {
        SideMenu.toggle()
    }
    
}
