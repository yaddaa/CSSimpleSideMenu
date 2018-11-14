import UIKit

public class SideMenu {
    
    // MARK: - Properties
    
    private var currentState: SideMenuEnums.MenuState = .showed
    private var mainViewController = SideMenuViewController.instanceInitial()
    private var models: [SideMenuControllerModel]!
    private var customization: SideMenuCustomizationModel!
    static let shared = SideMenu()

    // MARK: - Public
    
    class public func toggle() {
        shared.currentState.toggle()
        
        switch shared.currentState {
        case .hidden: shared.mainViewController.showMenu()
        case .showed: shared.mainViewController.hideMenu()
        }
    }
    
    class public func forceSelectViewController(at index: Int) {
        guard shared.models.count > index else { return }
        shared.hide()
        shared.didSelectViewController(index)
    }
    
    // MARK: - Configuration
    class public func configure(with controllers: [SideMenuControllerModel], customization: SideMenuCustomizationModel?) {
        
        shared.models = controllers
        shared.customization = customization ?? SideMenuCustomizationModel()
        
        //set delegate 
        shared.mainViewController.delegate = shared
        
        //set side menu as root controller in application window
        UIApplication.shared.delegate?.window??.rootViewController = shared.mainViewController
        UIApplication.shared.delegate?.window??.makeKeyAndVisible()
    }

    internal func didSelectViewController(_ selectedIndex: Int) {
        mainViewController.setViewController(models[selectedIndex].viewController)
        hide()
    }
    
}

// MARK: SideMenuConfiguration
extension SideMenu {
    
    class func configuration() -> SideMenuConfigurationModel {
        let names = shared.models.map({ $0.visibleName })
        let configuration = SideMenuConfigurationModel(visibleNames: names) { (index) in
            shared.didSelectViewController(index)
        }
        configuration.customization = shared.customization
        
        return configuration
    }
    
    class func firstControllerModel() -> SideMenuControllerModel?  {
        return shared.models.first
    }
    
    class func isLeftSideMenu() -> Bool {
        return shared.customization.position == .left
    }
    
}

// MARK: - SideMenuViewControllerDelegate
extension SideMenu: SideMenuViewControllerDelegate {
    
    internal func hide() {
        guard SideMenu.shared.currentState == .hidden else { return }
        SideMenu.toggle()
    }
    
}
