import Foundation

final class LocationManager: ObservableObject {
    @Published var locations: [Location] = []
}
