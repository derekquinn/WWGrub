import CloudKit

struct CloudKitManager {

    static func getLocations(completion: @escaping (Result<[Location], Error>) -> Void) {
        let alphabeticalSort = NSSortDescriptor(key: Constant.kName, ascending: true)
        let query = CKQuery(recordType: Constant.kLocationRecord, predicate: NSPredicate(value: true))
        query.sortDescriptors = [alphabeticalSort]

        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            guard error == nil,
                  let records = records else {
                completion(.failure(error!))
                return
            }
            let locations = records.map { $0.convertToLocation() }
            completion(.success(locations))
        }
    }
}

extension CKRecord {
    func convertToLocation() -> Location { Location(record: self) }
    func convertToProfile() -> Profile { Profile(record: self) }
}
