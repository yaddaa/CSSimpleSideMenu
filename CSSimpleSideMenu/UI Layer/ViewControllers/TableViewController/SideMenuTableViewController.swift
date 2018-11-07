import UIKit

final class SideMenuTableViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var bottomImageView: UIImageView!
    
    // MARK: - Constraints
    
    @IBOutlet weak var bottomImageContentViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var topImageContentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentViewTrailingConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    
    private var configuration: SideMenuConfigurationModel!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        configure()
    }
    
    private func setupTableView() {
        tableView.registerReusableCell(cellType: SideMenuTVCell.self)
        
        tableView.tableFooterView = UIView()
        
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
    }
    
    private func configure() {
        configuration = SideMenu.configuration()
        
        //set background
        backgroundImageView.image = configuration.customization.backgroundImage
        view.backgroundColor = configuration.customization.backgroundColor
        
        // set images
        topImageView.image = configuration.customization.topImage
        bottomImageView.image = configuration.customization.bottomImage
        
        // set content mode
        topImageView.contentMode = configuration.customization.imagesContentMode
        bottomImageView.contentMode = configuration.customization.imagesContentMode
        
        // set heights
        topImageContentViewHeightConstraint.constant = configuration.customization.topImageHeight
        bottomImageContentViewConstraint.constant = configuration.customization.bottomImageHeight
        
        // set position
        let offset = view.bounds.width * 0.15
        if configuration.customization.position == .right {
            contentViewLeadingConstraint.constant = offset
        } else {
            contentViewTrailingConstraint.constant = offset
        }
    }
    
}

extension SideMenuTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configuration?.visibleNames.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTVCell.reuseIdentifier, for: indexPath) as! SideMenuTVCell
        cell.configure(for: configuration.visibleNames[indexPath.item], customization: configuration.customization)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return configuration.customization.menuItemsHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        configuration?.onSelectNewControllerClosure?(indexPath.item)
    }

}


