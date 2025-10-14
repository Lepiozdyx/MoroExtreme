import Foundation

struct Bike: Identifiable, Codable {
    let id: String
    let name: String
    let shortDescription: String
    let fullDescription: String
    let imageName: String
    let features: [Feature]
}

struct Feature: Codable {
    let text: String
    let isPositive: Bool
}
