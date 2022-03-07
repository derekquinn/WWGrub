import MapKit

final class LocationMapViewModel: ObservableObject {
    @Published var alertItem: AlertItem?
    @Published var locations: [Location] = []
    @Published var detroit = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.33542, longitude: -83.04916),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    func getLocations() {
        CloudKitManager.getLocations { [self] result in
            switch result {
            case .success(let locations):
                self.locations = locations
            case .failure:
                alertItem = AlertContext.unableToGetLocations
            }
        }
    }
}
