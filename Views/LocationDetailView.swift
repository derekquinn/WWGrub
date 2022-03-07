import SwiftUI

struct LocationDetailView: View {
    var body: some View {
        
        let columns = [GridItem(.flexible()),
                       GridItem(.flexible()),
                       GridItem(.flexible())
        ]

        VStack(spacing: 16) {
            Image("default-banner-asset")
                .resizable()
                .scaledToFill()
                .frame(height: 120)
            HStack {
                Label("123 Main St.", systemImage: "mappin.and.ellipse")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
            }.padding(.horizontal)
            Text("This is a test description.This is a test description.This is a test description.This is a test description.This is a test description.")
                .lineLimit(3)
                .minimumScaleFactor(0.75)
                .frame(height: 70)
                .padding(.horizontal)
            
            ZStack {
                Capsule()
                    .frame(height: 80)
                    .foregroundColor(Color(.secondarySystemBackground))
                HStack(spacing: 20) {
                    Button {
                        
                    } label: {
                        LocationActionButton(color: Color("brandPrimary"), imageName: "location.fill")
                    }
                    Button {
                        
                    } label: {
                        LocationActionButton(color: Color("brandPrimary"), imageName: "network")
                    }
                    Button {
                        
                    } label: {
                        LocationActionButton(color: Color("brandPrimary"), imageName: "phone.fill")
                    }
                    Button {
                        
                    } label: {
                        LocationActionButton(color: Color("brandPrimary"), imageName: "person.fill.checkmark")
                    }
                }
            }
            .padding(.horizontal)

            Text("Who is here?")
                .bold()
                .font(.title2)
            ScrollView {
                LazyVGrid(columns: columns) {
                    FirstNameAvatarView(firstName: "Dave")
                    FirstNameAvatarView(firstName: "Lisa")
                    FirstNameAvatarView(firstName: "Brenden")
                    FirstNameAvatarView(firstName: "Dave")
                    FirstNameAvatarView(firstName: "Lisa")
                    FirstNameAvatarView(firstName: "Brenden")
                    FirstNameAvatarView(firstName: "Dave")
                    FirstNameAvatarView(firstName: "Lisa")
                    FirstNameAvatarView(firstName: "Brenden")
                    FirstNameAvatarView(firstName: "Dave")
                }
            }
            Spacer()
        }
        .navigationTitle("Location Name")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView()
    }
}

struct LocationActionButton: View {
    var color: Color
    var imageName: String

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 60, height: 60)
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 22, height: 22)
        }
    }
}

struct FirstNameAvatarView: View {
    var firstName: String

    var body: some View {
        VStack {
            AvatarView(size: 64)
            Text(firstName)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
    }
}
