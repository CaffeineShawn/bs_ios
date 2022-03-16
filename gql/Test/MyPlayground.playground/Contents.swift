import PlaygroundSupport
import UIKit
class AutoTrimmingWhiteSpace {
    var content: String {
        didSet {
            self.content = content.trimmingCharacters(in: .whitespaces)
        }
    }
    
    init(content: String) {
        defer {
            self.content = content
        }
        self.content = content
    }
    
    
}

class MyViewController: UITableViewController {
    override func viewDidLoad() {
        title = "Hello UIKit!"
    }
    var reasons = ["fuck u swiftui", "bull shit"]
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reasons.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // attempt to dequeue a cell
        var cell: UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "Cell")

        if cell == nil {
            // none to dequeue – make a new one
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            cell?.accessoryType = .disclosureIndicator
        }

        // configure cell here
        let reason = reasons[indexPath.row]
        cell.detailTextLabel?.text = "Why do I choose UIKit? Because \(reason)"
        cell.textLabel?.text = "Reason #\(indexPath.row + 1)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let text = tableView.cellForRow(at: indexPath)?.detailTextLabel?.text else {return}
        let detailView = MyDetailViewController()
        detailView.message = text
        navigationController?.pushViewController(detailView, animated: true)
    }
}

class MyDetailViewController: UIViewController {
    var message = ""
    var animator: UIDynamicAnimator?
    override func loadView() {
        title = "loading"
        view = UIView()
        view.backgroundColor = .white
    }
    override func viewDidLayoutSubviews() {
        guard animator == nil else {
            return
        }
        
        let words = message.components(separatedBy: " ")
        
        var labels = [UILabel]()
        
        for (idx, word) in words.enumerated() {
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .title1)
            
            label.center = CGPoint(x: view.frame.midX, y: 50+CGFloat(30*idx))
            label.text = word
            label.sizeToFit()
            view.addSubview(label)
            
            labels.append(label)
        }
        
        let gravity = UIGravityBehavior(items: labels)
        
        animator = UIDynamicAnimator(referenceView: view)
        animator?.addBehavior(gravity)
        
        let collisions = UICollisionBehavior(items: labels)
        
        collisions.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collisions)
    }
    
}
let master = MyViewController()
let nav = UINavigationController(rootViewController: master)
PlaygroundPage.current.liveView = nav
