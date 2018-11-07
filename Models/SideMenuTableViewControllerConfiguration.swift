final class SideMenuConfigurationModel {
    
    let visibleNames: [String]
    let onSelectNewControllerClosure: ((Int) -> ())?
    var customization = SideMenuCustomizationModel()
    
    init(visibleNames: [String], onSelectNewControllerClosure: ((Int) -> ())?) {
        self.visibleNames = visibleNames
        self.onSelectNewControllerClosure = onSelectNewControllerClosure
    }
    
    
    
}
