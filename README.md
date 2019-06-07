![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/banner.png)

Toyay is a simple app guiding you step by step in how to build your first iPhone app. In this ocasion you'll build a simple ToDo app.

[Before getting started make sure to download Xcode from the App Store](https://itunes.apple.com/no/app/xcode/id497799835?mt=12).

After getting Xcode running, clone the project and open Toyay.xcodeproj

If you're feeling stuck feel free to switch to the branch for each step and catch up from there.

### Step 1

Switch to the `step1` branch to get started and run the project pressing `CMD + R`.

This is what you should see:

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-1.jpg)


### Step 2

Change the color of the view to red

`ViewController.swift`

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .red
}
```

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-2.jpg)

### Step 3

Add UITableViewController with hardcoded cells

`ViewController.swift`

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = "Hello WiT"
    return cell
}
```

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-3.jpg)

### Step 4

Add model

`Task.swift`

```swift
import Foundation

class Task: NSObject {
    let title: String

    init(title: String) {
        self.title = title
    }
}
```

`ViewController.swift`

```
let tasks = [
    Task(title: "Do my homework ✍️"),
    Task(title: "Do the laundry 👚"),
    Task(title: "Make my first iPhone app 📱")
]

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = tasks[indexPath.row].title
    return cell
}
```

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-4.jpg)

### Step 5

Add new item button

`ViewController.swift`

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
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
```

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-5.jpg)

### Step 6

Slide to complete

`ViewController.swift`

```swift
override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    let complete = UITableViewRowAction(style: .normal, title: "Complete") { _, indexPath in
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    complete.backgroundColor = view.tintColor

    return [complete]

}
```

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-6.jpg)

### Step 7

Persist your code

`ViewController.swift
```swift
static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
static let archiveURL = documentsDirectory.appendingPathComponent("tasks")

override func viewDidLoad() {
    //....

    loadTasks()
}

@objc func addItem() {
    //....

    let saveAction = UIAlertAction(title: "Save", style: .default, handler: { _ in
        if let text = alert.textFields?.last?.text {
            //...
            self.saveTasks()
        }
    })

    //...
}

override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    let complete = UITableViewRowAction(style: .normal, title: "Complete") { _, indexPath in
        //....
        self.saveTasks()
    }
    
    //....
}

func saveTasks() {
    let data = try! NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false)
    try! data.write(to: ViewController.archiveURL)
}

func loadTasks() {
    guard let data = FileManager().contents(atPath: ViewController.archiveURL.path) else { return }
    tasks = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Task] ?? [Task]()
}
```

`Task.swift`

```
enum Keys: String {
    case title
}

class Task: NSObject, NSCoding {
    ///...
    ///...

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
```

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-7.jpg)

### Step 8

Add date as a title

`ViewController.swift`

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .none
    dateFormatter.dateStyle = .medium
    title = dateFormatter.string(from: Date())
    navigationController?.navigationBar.prefersLargeTitles = true
}
```
![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-8.jpg)
