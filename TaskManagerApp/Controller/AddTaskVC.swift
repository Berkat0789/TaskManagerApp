//
//  AddTaskVC.swift
//  TaskManagerApp
//
//  Created by Yadilsa Diaz on 9/25/21.
//

import UIKit
import RxSwift

class AddTaskVC: UIViewController {
    
    @IBOutlet weak var prioritySegmented: UISegmentedControl!
    @IBOutlet weak var taskTextField: UITextField!
    
    
    private let taskPublisher = PublishSubject<Task>()
    var taskObserver: Observable<Task> {
        return taskPublisher.asObserver()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePressed(_ sender: Any) {
        guard let priority = Priority(rawValue: prioritySegmented.selectedSegmentIndex), let title = taskTextField.text else {return}
        let task = Task(title: title, priority: priority)
        self.taskPublisher.onNext(task)
        self.navigationController?.popViewController(animated: true)
    }
    

}
