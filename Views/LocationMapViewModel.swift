import MapKit

final class LocationMapViewModel: ObservableObject {
    @Published var alertItem: AlertItem?
    @Published var detroit = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.33542, longitude: -83.04916),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    func getLocations(with locationManager: LocationManager) {
        CloudKitManager.getLocations { [self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let locations):
                    locationManager.locations = locations
                case .failure:
                    alertItem = AlertContext.unableToGetLocations
                }
            }
        }
    }
}
