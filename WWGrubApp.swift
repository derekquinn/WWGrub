import SwiftUI

@main
struct WWGrubApp: App {

    let locationManger = LocationManager()

    var body: some Scene {
        WindowGroup {
            AppTabView().environmentObject(locationManger)
        }
    }
}
