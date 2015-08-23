//
//  ViewController.swift
//  ToDoList
//
//  Created by tho dang on 2015-08-23.
//  Copyright (c) 2015 Tho Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var toDoItem: ToDoItem?

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //  hide the keyboard when the background is touched
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
        
        }
        // super.touchesBegan(touches , withEvent:event)
        super.view.endEditing(true)
    }

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if count(textField.text.utf16) > 0 {
        self.toDoItem = ToDoItem(name: self.textField.text)
        }
    }
   
    
}
