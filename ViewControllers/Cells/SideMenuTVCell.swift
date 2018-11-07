import UIKit

final class SideMenuTVCell: UITableViewCell, NibReusable {
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Overrides

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        addSelectedView()
    }
    
    private func addSelectedView() {
        let selectedView = UIView()
        selectedView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).withAlphaComponent(0.1)
        selectedBackgroundView = selectedView
    }
    
    // MARK: - Public
    
    public func configure(for name: String, customization: SideMenuCustomizationModel) {
        titleLabel.text = name
        titleLabel.textColor = customization.menuItemsTitleColor
        titleLabel.font = customization.menuItemsFont

        selectedBackgroundView?.backgroundColor = customization.menuItemsSelectedColor
    }
}
