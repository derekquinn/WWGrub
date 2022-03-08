import SwiftUI

struct ProfileView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var company = ""
    @State private var bio = ""
    @State private var avatar = PlaceholderImage.avatar

    var body: some View {
        VStack {
            ZStack {
                NameBackgroundView()
                HStack(spacing: 16) {
                    ZStack {
                        AvatarView(size: 84, image: PlaceholderImage.avatar)
                        EditImage()
                    }
                    .padding(.leading, 12)

                    VStack(spacing: 1) {
                        TextField("First name", text: $firstName)
                            .profileNameStyle()
                        TextField("First name", text: $lastName)
                            .profileNameStyle()
                        TextField("Company Name", text: $company)
                    }
                }
                .padding()
            }
            VStack(alignment: .leading) {
                CharactersRemainView(currentCount: bio.count)
                TextEditor(text: $bio)
                    .frame(height: 100)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary, lineWidth: 1))
            }
            .padding(.horizontal, 20)
            Spacer()
            Button {
                // TODO: Add an action
            } label: {
                BrandedButton(title: "Create Profile")
            }
        }
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
    }
}

struct ProfileNameText: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.system(size: 32, weight: .bold))
        .lineLimit(1)
        .minimumScaleFactor(0.75)
    }
}

struct NameBackgroundView: View {
    var body: some View {
        Color(.secondarySystemBackground)
            .frame(height: 130)
            .cornerRadius(12)
            .padding(.horizontal)
    }
}

struct EditImage: View {
    var body: some View {
        Image(systemName: "square.and.pencil")
            .resizable()
            .scaledToFit()
            .frame(width: 14, height: 14)
            .foregroundColor(.white)
            .offset(y: 30)
    }
}

struct CharactersRemainView: View {
    var currentCount: Int
    var body: some View {
        Text("Bio: ")
            .font(.callout)
            .foregroundColor(.secondary)
        +
        Text("\(100 - currentCount)")
            .bold()
            .font(.callout)
            .foregroundColor(currentCount <= 100 ? Color("brandPrimary") : Color(.systemPink))
        +
        Text(" characters remain")
            .font(.callout)
            .foregroundColor(.secondary)
    }
}
