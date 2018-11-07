extension Bundle {
    
    class func podBundle(for any: AnyClass) -> Bundle? {
        let podBundle = Bundle(for: any)
        
        if let bundleURL = podBundle.url(forResource: "CSSimpleSideMenu", withExtension: "bundle") {
            return Bundle(url: bundleURL)
        }
        
        return Bundle.main
    }
    
}
