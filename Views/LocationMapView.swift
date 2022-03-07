import SwiftUI
import MapKit

struct LocationMapView: View {

    @State private var alertItem: AlertItem?
    @State private var detroit = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.33542, longitude: -83.04916),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    var body: some View {
        ZStack {
            Map(coordinateRegion: $detroit).ignoresSafeArea()

            VStack {
                LogoView()
                    .shadow(radius: 10)
                Spacer()
            }
        }.alert(item: $alertItem, content: { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        })
        .onAppear {
            CloudKitManager.getLocations { result in
                switch result {
                case .success(let locations):
                    print("[INFO] \(locations)")
                case .failure:
                    alertItem = AlertContext.unableToGetLocations
                }
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
