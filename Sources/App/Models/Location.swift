
final class Location: Codable {
    var lat: Double
    var lng: Double
    
    
    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
}
