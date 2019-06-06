import Foundation

enum Keys: String {
    case title
}

class Task: NSObject, NSCoding {
    let title: String

    init(title: String) {
        self.title = title
    }

    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObject(forKey: Keys.title.rawValue) as? String else  {
            return nil
        }

        self.init(title: title)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: Keys.title.rawValue)
    }
}
