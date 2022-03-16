//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Martin Michalko on 22/06/2017.
//  Copyright © 2017 Martin Michalko. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var TaskNameTextField: UITextField!
    
    @IBOutlet weak var ImportanceSwitch: UISwitch!
    
    var previousVC = TasksViewController()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = TaskNameTextField.text!
        task.importance = ImportanceSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
  
        navigationController!.popViewController(animated: true)
    }
  
    

}
