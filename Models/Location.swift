import CloudKit

struct Location: Identifiable {

    let id: CKRecord.ID
    let name: String
    let description: String
    let squareAsset: CKAsset?
    let bannerAsset: CKAsset?
    let address: String
    let location: CLLocation
    let websiteURL: String
    let phoneNumber: String

    init(record: CKRecord) {
        id = record.recordID
        name = record[Constant.kName] as? String ?? ""
        description = record[Constant.kDescription] as? String ?? ""
        squareAsset = record[Constant.kSquareAsset] as? CKAsset
        bannerAsset = record[Constant.kBannerAsset] as? CKAsset
        address = record[Constant.kAddress] as? String ?? ""
        location = record[Constant.kLocation] as? CLLocation ?? Constant.kDefaultLocation
        websiteURL = record[Constant.kWebsiteURL] as? String ?? ""
        phoneNumber = record[Constant.kPhoneNumber] as? String ?? ""
    }
}
