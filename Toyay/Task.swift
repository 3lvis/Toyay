import Foundation

class Task {
    let id = UUID().uuidString
    let title: String
    var isCompleted: Bool = false

    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
