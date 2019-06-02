import Foundation

enum Keys: String {
    case id
    case title
    case isCompleted
}

class Task: NSObject, NSCoding {
    let id: String
    let title: String
    var isCompleted: Bool

    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }

    required convenience init?(coder aDecoder: NSCoder) {
        guard let id = aDecoder.decodeObject(forKey: Keys.id.rawValue) as? String else  {
            return nil
        }

        guard let title = aDecoder.decodeObject(forKey: Keys.title.rawValue) as? String else  {
            return nil
        }

        let isCompleted = aDecoder.decodeBool(forKey: Keys.isCompleted.rawValue)

        self.init(id: id, title: title, isCompleted: isCompleted)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: Keys.id.rawValue)
        aCoder.encode(title, forKey: Keys.title.rawValue)
        aCoder.encode(isCompleted, forKey: Keys.isCompleted.rawValue)
    }
}
