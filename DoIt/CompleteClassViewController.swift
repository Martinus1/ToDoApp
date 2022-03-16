//
//  CompleteClassViewController.swift
//  DoIt
//
//  Created by Martin Michalko on 22/06/2017.
//  Copyright © 2017 Martin Michalko. All rights reserved.
//

import UIKit

class CompleteClassViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    
    var task : Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task!.importance {
            
            taskLabel.text = "❗️\(task!.name!)"
            
        }
        else{
            
            taskLabel.text = task!.name!
            
        }

        
        // Do any additional setup after loading the view.
    }

    @IBAction func completePressed(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
