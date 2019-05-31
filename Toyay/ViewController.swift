import UIKit

class ViewController: UITableViewController {
    var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .medium
        title = dateFormatter.string(from: Date())

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = tasks[indexPath.row].title
        return cell
    }

    @objc func add() {
        let alert = UIAlertController(title: "What do you need to get done?", message: nil, preferredStyle: .alert)

        alert.addTextField(configurationHandler: nil)

        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { _ in
            if let text = alert.textFields?.last?.text {
                let indexPath = IndexPath(row: self.tasks.count, section: 0)
                let task = Task(title: text)
                self.tasks.append(task)
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
        })
        alert.addAction(saveAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)

        alert.preferredAction = saveAction
        present(alert, animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let complete = UITableViewRowAction(style: .normal, title: "Complete") { _, indexPath in
            self.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }

        complete.backgroundColor = view.tintColor

        return [complete]

    }
}

