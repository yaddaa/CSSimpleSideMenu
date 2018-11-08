import UIKit

class SideMenuViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var contentContainer: UIView!
    @IBOutlet weak var tableContainer: UIView!
    
    // MARK: - Properties
    
    weak var delegate: SideMenuViewControllerDelegate?
    
    // MARK: - ChildControllers
    
    private var navigationViewController: UINavigationController!
    private var menuTableViewController: SideMenuTableViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let vc = segue.destination as? UINavigationController {
            navigationViewController = vc
        }
        
        if let vc = segue.destination as? SideMenuTableViewController {
            menuTableViewController = vc
        }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let model = SideMenu.firstControllerModel() else { return }
        setViewController(model.viewController)
    }
    
    // MARK: - Public
    
    public func setViewController(_ selected: UIViewController) {
        navigationViewController.setViewControllers([selected], animated: false)
    }
    
    public func showMenu() {
        if SideMenu.isLeftSideMenu() {
            moveContentContainerToRightSide()
        } else {
            moveContentContainerToLeftSide()
        }
        
        contentContainer.isUserInteractionEnabled = false
        tableContainer.isUserInteractionEnabled = true
    }
    
    public func hideMenu() {
        moveContentContainerToDefault()
        
        contentContainer.isUserInteractionEnabled = true
        tableContainer.isUserInteractionEnabled = false
    }

}

// MARK: - Gestures
extension SideMenuViewController {
    
    @IBAction private func receiveTap(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: contentContainer)
        if contentContainer.point(inside: point, with: nil) {
            delegate?.hide()
        }
    }
    
    @IBAction private func receiveSwipe(_ sender: UISwipeGestureRecognizer) {
        delegate?.hide()
    }
    
}

// MARK: - Private Animation Help
extension SideMenuViewController {
    
    private func moveContentContainerToDefault() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.contentContainer.transform = .identity
        })
    }
    
    private func moveContentContainerToRightSide() {
        var transform = CATransform3DIdentity
        transform = CATransform3DScale(transform, 1, 0.9, 1)
        transform = CATransform3DTranslate(transform, view.bounds.width * 0.85, 0, 0)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.contentContainer.layer.transform = transform
        })
    }
    
    private func moveContentContainerToLeftSide() {
        var transform = CATransform3DIdentity
        transform = CATransform3DScale(transform, 1, 0.9, 1)
        transform = CATransform3DTranslate(transform, -(view.bounds.width * 0.85), 0, 0)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.contentContainer.layer.transform = transform
        })
    }
    
}
