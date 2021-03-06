
import Vapor
import FluentPostgreSQL

final class Station: Codable {
    var id: Int?
    var name: String
    var businessType: String
    var cost: String
    var rate: String
    var address: String
    var lat: Double
    var lng: Double
    var photoReference: String
    var b64Photo: String
    init(name: String, businessType: String, cost: String, rate: String, address: String, lat: Double, lng: Double, photoReference: String, b64Photo: String) {
        
        self.name = name
        self.businessType = businessType
        self.cost = cost
        self.rate = rate
        self.address = address
        self.lat = lat
        self.lng = lng
        self.photoReference = photoReference
        self.b64Photo = b64Photo
    }
}

extension Station: PostgreSQLModel {}
extension Station: Migration {}
extension Station: Content {}
extension Station: Parameter {}
