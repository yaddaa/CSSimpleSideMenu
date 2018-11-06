extension Bundle {
    
    class var podBundle: Bundle? {
        let podBundle = Bundle(for: self)
        let bundleURL = podBundle.url(forResource: "CSSimpleSideMenu", withExtension: "bundle")!
        let bundle = Bundle(url: bundleURL)
        return bundle
    }
    
}
