import UIKit
import CSSimpleSideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let controllers = [
            SideMenuControllerModel(with: FirstViewController.instance(), name: "First"),
            SideMenuControllerModel(with: SecondViewController.instance(), name: "Second"),
            SideMenuControllerModel(with: ThirdViewController.instance(), name: "Third")
        ]
        
        let customization = SideMenuCustomizationModel()
        customization.position = .left
        
        SideMenu.configure(with: controllers, customization: customization)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            SideMenu.forseSelectViewController(at: 0)
//        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
}
