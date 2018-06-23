
final class Feed: Codable {
    var xmlns: String
    var xmlns$openSearch: String
    var entry: [Row]
    
    init(xmlns: String, xmlns$openSearch: String, entry: [Row]) {
        self.xmlns = xmlns
        self.xmlns$openSearch = xmlns$openSearch
        self.entry = entry
    }
}


