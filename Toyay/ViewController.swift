import UIKit

class ViewController: UITableViewController {
    var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].title
        return cell
    }

    @objc func addItem() {
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
}

