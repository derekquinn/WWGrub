import SwiftUI
import MapKit

struct LocationMapView: View {

    @StateObject private var viewModel = LocationMapViewModel()
    @EnvironmentObject private var locationManager: LocationManager

    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.detroit, showsUserLocation: true, annotationItems: locationManager.locations) { location in
                MapMarker(coordinate: location.location.coordinate, tint: .green)
            }.ignoresSafeArea()
            VStack {
                LogoView()
                    .shadow(radius: 10)
                Spacer()
            }
        }.alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        })
        .onAppear {
            viewModel.checkIfLocationServicesIsEnabled()
            if locationManager.locations.isEmpty {
                viewModel.getLocations(with: locationManager)
            }
        }
    }
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView()
    }
}

struct LogoView: View {
    var body: some View {
        Image("ddg-map-logo")
            .resizable()
            .scaledToFit()
            .frame(height: 70)
    }
}
