//
//  ViewController.swift
//  TaskManagerApp
//
//  Created by Yadilsa Diaz on 9/25/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {

    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var segmentedView: UISegmentedControl!
    
    private var filteredTask = [Task]()
    private var bag = DisposeBag()
    
    private var tasks = BehaviorRelay<[Task]>(value: [])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listToAdd" {
            guard let addVC = segue.destination as? AddTaskVC else {return}
            //Add observer requedt for the task here
            let ta = addVC.taskObserver.subscribe(onNext: { task in

                
                var currentlist = self.tasks.value
                currentlist.append(task)
                self.tasks.accept(currentlist)
                                
                DispatchQueue.main.async {
                    self.taskTableView.reloadData()
                }
            }, onError: { err in
                print("There was an error \(err)")
            }, onCompleted: {
                print("Completed")
            }, onDisposed: {
                print("Disposed")
            })
            ta.disposed(by: bag)
        }
    }

    @IBAction func didselectSegments(_ sender: UISegmentedControl) {
        guard let pro = Priority(rawValue: sender.selectedSegmentIndex) else {return self.filteredTask = tasks.value}
        print(pro)
        self.filteredTask = self.flilterTasksby(priority: pro)
        DispatchQueue.main.async {
            self.taskTableView.reloadData()
        }
    }
    
    
    @IBAction func addPressed(_ sender: Any) {
        performSegue(withIdentifier: "listToAdd", sender: self)
    }
    
    
    private func flilterTasksby(priority: Priority) -> [Task] {
        switch priority {
        case .all:
            return tasks.value
        case .high:
            return tasks.value.filter({$0.priority == .high})
        case .medium:
            return tasks.value.filter({$0.priority == .medium})
        case .low:
            return tasks.value.filter({$0.priority == .low
            })
        }
    
    }
    
}






//MARK: EXTENSIONS

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTask.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = filteredTask[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
    
    
}
