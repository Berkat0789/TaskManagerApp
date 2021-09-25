//
//  AddTaskVC.swift
//  TaskManagerApp
//
//  Created by Yadilsa Diaz on 9/25/21.
//

import UIKit

class AddTaskVC: UIViewController {
    
    @IBOutlet weak var prioritySegmented: UISegmentedControl!
    @IBOutlet weak var taskTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePressed(_ sender: Any) {
        guard let priority = Priority(rawValue: prioritySegmented.selectedSegmentIndex), let title = taskTextField.text else {return}
        let task = Task(title: title, priority: priority)
        print(task)
    }
    

}
