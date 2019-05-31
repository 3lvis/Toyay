import Foundation

class Task {
    let id = UUID().uuidString
    let title: String
    var isCompleted: Bool = false

    init(title: String) {
        self.title = title
    }
}
