import SwiftUI

struct LogoView: View {

    var frameWidth: CGFloat

    var body: some View {
        Image("ddg-map-logo")
            .resizable()
            .scaledToFit()
            .frame(height: frameWidth)
    }
}
