//
//  homeworkSend.swift
//  Login
//
//  Created by Eleazar Contreras on 12/17/18.
//  Copyright © 2018 Eleazar Contreras. All rights reserved.
//
import UIKit
import Foundation

class homeworkSend: NSObject {
    //properties
    
    var homework: String?
    var due: String?

    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(homework: String, due: String) {
        
        self.homework = homework
        self.due = due
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Homework: \(homework), Due: \(due))"
        
    }
    
    
}
