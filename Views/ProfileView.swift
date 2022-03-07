import SwiftUI

struct ProfileView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var company = ""
    @State private var bio = ""

    var body: some View {
        VStack {
            ZStack {
                Color(.secondarySystemBackground)
                    .frame(height: 130)
                    .cornerRadius(12)
                    .padding(.horizontal)
                HStack(spacing: 16) {
                    ZStack {
                        AvatarView(size: 84)
                        
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                            .foregroundColor(.white)
                            .offset(y: 30)
                    }
                    .padding(.leading, 12)

                    VStack(spacing: 1) {
                        TextField("First name", text: $firstName)
                            .font(.system(size: 32, weight: .bold))
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                        TextField("First name", text: $lastName)
                            .font(.system(size: 32, weight: .bold))
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                        TextField("Company Name", text: $company)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                    }
                }
                .padding()
            }
            VStack(alignment: .leading) {
                Text("Bio: ")
                    .font(.callout)
                    .foregroundColor(.secondary)
                +
                Text("\(100 - bio.count)")
                    .bold()
                    .font(.callout)
                    .foregroundColor(bio.count <= 100 ? Color("brandPrimary") : Color(.systemPink))
                +
                Text(" characters remain")
                    .font(.callout)
                    .foregroundColor(.secondary)
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
                Text("Create Profile")
                    .bold()
                    .frame(width: 280, height: 44)
                    .background(Color("brandPrimary"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
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
