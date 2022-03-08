import SwiftUI

struct AvatarView: View {

    var size: CGFloat
    var image: UIImage

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}
