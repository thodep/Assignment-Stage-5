//
//  ToDoItem.swift
//  ToDoList
//
//  Created by tho dang on 2015-08-23.
//  Copyright (c) 2015 Tho Dang. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    
    var itemName: NSString = ""
    var completed:Bool = false
    var creationDate: NSDate = NSDate()
    
    init(name:String) {
        self.itemName = name}
    }
   

