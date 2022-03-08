import CoreLocation
import UIKit

enum Constant {
    static let kDefaultLocation = CLLocation(latitude: 42.33542, longitude: -83.04916)
    static let kLocationRecord = "WWGLocation"
    static let kProfileRecord = "WWGProfile"

    static let kName = "name"
    static let kDescription = "description"
    static let kSquareAsset = "squareAsset"
    static let kBannerAsset = "bannerAsset"
    static let kAddress = "address"
    static let kLocation = "location"
    static let kWebsiteURL = "websiteURL"
    static let kPhoneNumber = "phoneNumber"

    static let kFirstName = "firstName"
    static let kLastName = "lastName"
    static let kAvatar = "avatar"
    static let kBio = "bio"
    static let kCompanyName = "companyName"
    static let kIsCheckedIn = "isCheckedIn"

    static let kHasSeenOnboardView = "hasSeenOnboardView"
}

enum PlaceholderImage {
    static let avatar = UIImage(named: "default-avatar")!
    static let square = UIImage(named: "default-square-asset")!
    static let banner = UIImage(named: "default-banner-asset")!

    static func getPlaceHolder(for dimension: ImageDimension) -> UIImage {
        switch dimension {
        case .square:
            return PlaceholderImage.square
        case .banner:
            return PlaceholderImage.banner
        }
    }
}

enum ImageDimension {
    case square, banner
}
