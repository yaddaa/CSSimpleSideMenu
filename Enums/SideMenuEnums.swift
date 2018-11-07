import UIKit

public struct SideMenuEnums {
    
    // MARK: - MenuState
    
    internal enum MenuState {
        case showed
        case hidden
        
        mutating func toggle() {
            self = self == .showed ? .hidden : .showed
        }
    }
    
    public enum Position {
        case left
        case right
    }
    
}
