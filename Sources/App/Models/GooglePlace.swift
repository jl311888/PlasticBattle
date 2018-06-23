
final class GooglePlace: Codable {
    var id: Int?
    var status: String
    var candidates: [Candidate]
    init(status: String, candidates: [Candidate]) {
        self.status = status
        self.candidates = candidates
    }
}
