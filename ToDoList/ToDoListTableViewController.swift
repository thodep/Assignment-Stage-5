//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by tho dang on 2015-08-23.
//  Copyright (c) 2015 Tho Dang. All rights reserved.
//

import UIKit


class ToDoListTableViewController: UITableViewController {
    //Declare to do items array
    var toDoItems: NSMutableArray = []
    
    //Add a function to load some initial data:
    func loadInitialData() {
    var item1 = ToDoItem(name: "Buy Milk")
     toDoItems.addObject(item1)
        
    var item2 = ToDoItem(name: "Buy Love")
      toDoItems.addObject(item2)
        
     var item3 = ToDoItem(name: "Cut Meat")
        toDoItems.addObject(item3)

    }
    
    //To enable the Unwind Segue you need to add some code first. In this case we want to come back ToDoListTableViewController
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        var source: ViewController = segue.sourceViewController as! ViewController
        if var item: ToDoItem = source.toDoItem {
        self.toDoItems.addObject(item)
            self.tableView.reloadData()
        
        }
        print("go back TableVC")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Call loadInitialData() in the viewDidLoad() method:
        loadInitialData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath) as! UITableViewCell

        var todoitem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        
        cell.textLabel!.text = todoitem.itemName as String
        
        //a checkmark will appear when you tap an item on the list. Tapping the item again will uncheck it.
        if todoitem.completed{
        cell.accessoryType = .Checkmark
        } else{
            
        cell.accessoryType = .None
        }

        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {tableView.deselectRowAtIndexPath(indexPath, animated: false)
        var tappedItem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as!ToDoItem
        tappedItem.completed = !tappedItem.completed
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
