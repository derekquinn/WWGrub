import CloudKit

struct MockData {
    static var location: CKRecord {
        let record = CKRecord(recordType: "WWGLocation")
        record[Constant.kName] = "A Good Place 2 Go"
        record[Constant.kAddress] = "666 London Rd. Detroit, MI 48230"
        record[Constant.kDescription] = "This is where a description would go for a fine place like this"
        record[Constant.kWebsiteURL] = "https://www.ironmaiden.uk"
        record[Constant.kLocation] = CLLocation(latitude: 42.33542, longitude: -83.04916) // Detroit is the location
        record[Constant.kPhoneNumber] = "330-499-9553"
        return record
    }
}
