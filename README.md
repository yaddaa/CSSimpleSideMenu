# CSSimpleSideMenu
<<<<<<< HEAD

[![Version](https://img.shields.io/cocoapods/v/CSSimpleSideMenu.svg?style=flat)](https://cocoapods.org/pods/CSSimpleSideMenu)
[![License](https://img.shields.io/cocoapods/l/CSSimpleSideMenu.svg?style=flat)](https://cocoapods.org/pods/CSSimpleSideMenu)
[![Platform](https://img.shields.io/cocoapods/p/CSSimpleSideMenu.svg?style=flat)](https://cocoapods.org/pods/CSSimpleSideMenu)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Screenshots

<div align="center">
    <img src="https://raw.githubusercontent.com/yaddaa/CSSimpleSideMenu/master/etc/Screenshot.png" width="320px" height="568px"</img> 
</div>

## Requirements
- [x] Xcode 9.4.
- [x] Swift 4.1.
- [x] iOS 10 or higher.

## Installation
### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate SideMenu into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'CSSimpleSideMenu', '~> 1.0.2'
```

Then, run the following command:

```bash
$ pod install
```

## Usage

First Step:
```swift
import CSSimpleSideMenu
```

Second Step:
```swift

//create controllers like this

public init(with controller: UIViewController, name: String)

//example
let controllers = [
SideMenuControllerModel(with: FirstViewController.instance(), name: "First"),
SideMenuControllerModel(with: SecondViewController.instance(), name: "Second")
]

// create customization model
let customization = SideMenuCustomizationModel()

//customize
customization.position = .left

//configure
SideMenu.congifure(with: controllers, customization: customization)
// need to call at start the application
```
## Customization Model Properties

```swift

// background side menu settings
// you can set just background colod
public var backgroundColor: UIColor = UIColor(red: 0.209, green: 0.251, blue: 0.311, alpha: 1)
// or background image
public var backgroundImage: UIImage? = nil


// background color for selected item
public var menuItemsSelectedColor: UIColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.1)

public var menuItemsFont: UIFont = .boldSystemFont(ofSize: 17)
public var menuItemsTitleColor: UIColor = .white
public var menuItemsHeight: CGFloat = 64

// set .left or .right side bar position
public var position: SideMenuEnums.Position = .left

```

## Author

Chelak Stas, yaddaa2@gmail.com

## License

CSSimpleSideMenu is available under the MIT license. See the LICENSE file for more info.
=======
A simple side menu for small projects

