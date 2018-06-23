
final class Candidate: Codable {
    var formatted_address: String
    var geometry: Geometry
    var photos: [Photo]
    
    struct Photo: Codable {
        var photo_reference: String
    }
    
    init(formatted_address: String, geometry: Geometry, photos: [Photo]) {
        self.formatted_address = formatted_address
        self.geometry = geometry
        self.photos = photos
    }
}
