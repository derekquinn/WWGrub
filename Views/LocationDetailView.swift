import SwiftUI

struct LocationDetailView: View {
    var location: Location
    var body: some View {
        let columns = [GridItem(.flexible()),
                       GridItem(.flexible()),
                       GridItem(.flexible())
        ]

        VStack(spacing: 16) {
            BannerImageView(imageName: "default-banner-asset")
            HStack {
                AddresssView(address: location.address)
                Spacer()
            }.padding(.horizontal)
            DescriptionView(description: location.description)
            ZStack {
                Capsule()
                    .frame(height: 80)
                    .foregroundColor(Color(.secondarySystemBackground))
                HStack(spacing: 20) {
                    Button {
                    } label: {
                        LocationActionButton(color: Color("brandPrimary"), imageName: "location.fill")
                    }
                    Link(destination: URL(string: location.websiteURL)!) {
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
        .navigationTitle(location.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: Location(record: MockData.location))
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

struct BannerImageView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(height: 120)
    }
}

struct AddresssView: View {
    var address: String
    var body: some View {
        Label(address, systemImage: "mappin.and.ellipse")
            .font(.caption)
            .foregroundColor(.secondary)
    }
}

struct DescriptionView: View {
    var description: String
    var body: some View {
        Text(description)
            .lineLimit(3)
            .minimumScaleFactor(0.75)
            .frame(height: 70)
            .padding(.horizontal)
    }
}
