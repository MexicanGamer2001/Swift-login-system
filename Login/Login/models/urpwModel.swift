//
//  urpwModel.swift
//  Login
//
//  Created by Eleazar Contreras on 12/16/18.
//  Copyright © 2018 Eleazar Contreras. All rights reserved.
//

import Foundation
import UIKit
class urpwModal: NSObject {
    //properties
    
    var result: String?
    var message: String?
    var user: String?
    var pw: String?

    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name, @address, @latitude, and @longitude parameters
    
    init(result: String) {
        
        self.result = result

    }
    
    init(result:String, message: String) {
        self.result = result
        self.message = message
    }
    
    init(result:String, user: String, pw:String) {
        self.result = result
        self.user = user
        self.pw = pw
    }

    
    //prints object's current state
    
    override var description: String {
        return "Result: \(result)"
        
    }
    
    
}
