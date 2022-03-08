import SwiftUI

struct OnboardView: View {

    @Binding var isShowingOnboardView: Bool

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowingOnboardView = false
                } label : {
                    DismissButton()
                }
            }
            LogoView(frameWidth: 250)
                .padding(.bottom)
            VStack(alignment: .leading, spacing: 32) {
                OnBoardInfoView(imageName: "building.2.crop.circle",
                                title: "Fun Locations",
                                description: "Rendezvous at a fun location as long as you are wearing green.")
                OnBoardInfoView(imageName: "checkmark.circle",
                                title: "Turtle Time",
                                description: "Look out for the angry turtles, around every corner in the summer.")
                OnBoardInfoView(imageName: "person.2.circle",
                                title: "Don't Talk Loudly",
                                description: "Make sure you are extremely soft with your voice if you have to talk.")
            }
            .padding(.horizontal, 40)
            Spacer()
        }
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView(isShowingOnboardView: .constant(true))
    }
}

struct OnBoardInfoView: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(spacing: 26) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(Color("brandPrimary"))
            VStack {
                Text(title).bold()
                Text(description)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .minimumScaleFactor(0.75)
            }
        }
    }
}
