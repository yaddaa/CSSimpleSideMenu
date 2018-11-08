import UIKit

final class SideMenuTVCell: UITableViewCell, NibReusable {
    
    // MARK: - Outlets
    
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    
    var selectedColor: UIColor?
    
    // MARK: - Overrides

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        selectedView.backgroundColor = isSelected ? selectedColor : .clear
    }
    
    // MARK: - Public
    
    public func configure(for name: String, customization: SideMenuCustomizationModel) {
        titleLabel.text = name
        titleLabel.textColor = customization.menuItemsTitleColor
        titleLabel.font = customization.menuItemsFont

        selectedColor = customization.menuItemsSelectedColor
    }
    
}
