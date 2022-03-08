import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let unableToGetLocations = AlertItem(title: Text("Locations Error"),
                                                message: Text("Unable to retrieve locations. \nTry Again!"),
                                                dismissButton: .default(Text("OK")))
    static let locationRestricted = AlertItem(title: Text("Location Restricted"),
                                              message: Text("Unable to have fun at locations. \nTry Again!"),
                                              dismissButton: .default(Text("NO!")))
    static let locationDenied = AlertItem(title: Text("Location Denied"),
                                          message: Text("Unable to have fun at locations because of straight denial at this time. \nTry Again!"),
                                          dismissButton: .default(Text("See you next time")))
}
