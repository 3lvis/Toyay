import UIKit

class ViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "30th May, 2019"

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        cell.textLabel?.text = ":D"
        return cell
    }

    @objc func add() {
        let alert = UIAlertController(title: "What do you need to get done?", message: nil, preferredStyle: .alert)

        alert.addTextField(configurationHandler: { _ in            
        })

        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { _ in

        })
        alert.addAction(saveAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)

        alert.preferredAction = saveAction
        present(alert, animated: true, completion: nil)
    }
}

