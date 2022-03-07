import SwiftUI

struct BrandedButton: View {
    var title: String
    var body: some View {
        Text(title)
            .bold()
            .frame(width: 280, height: 44)
            .background(Color("brandPrimary"))
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

struct BrandedButton_Previews: PreviewProvider {
    static var previews: some View {
        BrandedButton(title: "Continue")
    }
}
