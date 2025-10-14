import Foundation

final class BikesManager {
    static let shared = BikesManager()
    
    private(set) var bikes: [Bike] = []
    
    private init() {
        loadBikes()
    }
    
    private func loadBikes() {
        guard let url = Bundle.main.url(forResource: "bikes", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decodedBikes = try? JSONDecoder().decode([Bike].self, from: data) else {
            return
        }
        bikes = decodedBikes
    }
}
