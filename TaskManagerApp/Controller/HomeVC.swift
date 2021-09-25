//
//  ViewController.swift
//  TaskManagerApp
//
//  Created by Yadilsa Diaz on 9/25/21.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var segmentedView: UISegmentedControl!
    
    private var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listToAdd" {
            let addVC = segue.destination as? AddTaskVC
            //Add observer requedt for the task here
        }
    }

    @IBAction func addPressed(_ sender: Any) {
        performSegue(withIdentifier: "listToAdd", sender: self)
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
    
    
}
