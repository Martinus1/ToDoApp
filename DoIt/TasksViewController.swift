//
//  TaskTsViewController.swift
//  DoIt
//
//  Created by Martin Michalko on 22/06/2017.
//  Copyright © 2017 Martin Michalko. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableView_1: UITableView!
    
    var tasks : [Task] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        TableView_1.dataSource = self
        TableView_1.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        TableView_1.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.importance {
            
            cell.textLabel?.text = "❗️" + "\(task.name!)"
            
        }
        else{
            
            cell.textLabel?.text = task.name!
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
        
    @IBAction func PlusPressed(_ sender: Any) {
        performSegue(withIdentifier: "plusSegue", sender: nil)
    }
    
    func getTasks(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        }catch{
            
            
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
  
        
        if segue.identifier == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteClassViewController
            nextVC.task = sender as? Task
            
        }
    }
}
    


