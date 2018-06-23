

final class Row: Codable {
    var id: [String: String]
    var gsx$name: [String: String]
    var gsx$businesstype: [String: String]
    var gsx$cost: [String: String]
    var gsx$rate: [String: String]
    var gsx$address: [String: String]
    
    init(id: [String: String], gsx$name: [String: String], gsx$businesstype: [String: String], gsx$cost: [String: String], gsx$rate: [String: String], gsx$address: [String: String]) {
        self.id = id
        self.gsx$name = gsx$name
        self.gsx$businesstype = gsx$businesstype
        self.gsx$cost = gsx$cost
        self.gsx$rate = gsx$rate
        self.gsx$address = gsx$address
    }
}
