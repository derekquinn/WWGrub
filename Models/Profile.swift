import CloudKit

struct Profile {

    let ckRecordID: CKRecord.ID
    let firstName: String
    let lastName: String
    let avatar: CKAsset!
    let companyName: String
    let bio: String
    let isCheckedIn: CKRecord.Reference? = nil

    init(record: CKRecord) {
        ckRecordID = record.recordID
        firstName = record[Constant.kFirstName] as! String
        lastName = record[Constant.kLastName] as! String
        avatar = record[Constant.kAvatar]
        companyName = record[Constant.kCompanyName] as! String
        bio = record[Constant.kBio] as! String
    }
}
