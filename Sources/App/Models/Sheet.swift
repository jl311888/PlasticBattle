
final class Sheet: Codable {
    var id: Int?
    var version: String
    var encoding: String
    var feed: Feed
    init(version: String, encoding: String, feed: Feed) {
        self.version = version
        self.encoding = encoding
        self.feed = feed
    }
}
