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

```swift
// ViewController.swift

override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .red
}
```

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-2.jpg)

### Step 3

Add UITableViewController with hardcoded cells

```swift
// ViewController.swift

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

```swift
// Task.swift

import Foundation

class Task: NSObject {
    let title: String

    init(title: String) {
        self.title = title
    }
}
```

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-4.jpg)

### Step 5

Add new item button

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
}
```

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-5.jpg)

### Step 6

Slide to complete

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-6.jpg)

### Step 7

Persist your code

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-7.jpg)

### Step 8

Add date as a title

![Toyay](https://raw.githubusercontent.com/3lvis/Toyay/master/GitHub/step-8.jpg)
