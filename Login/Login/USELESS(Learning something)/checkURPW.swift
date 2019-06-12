//
//  checkURPW.swift
//  Login
//
//  Created by Eleazar Contreras on 12/16/18.
//  Copyright © 2018 Eleazar Contreras. All rights reserved.
//

import Foundation
import UIKit

class checkURPW: NSObject, URLSessionDataDelegate {

     var data = Data()
    
    func downloadItems(username:String, password:String){
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://serenity.ist.rit.edu/~ec8155/Test/XCODEPROJECT/logSwift/login.php")! as URL)
        request.httpMethod = "POST"
        
        
        
        let postString = "user=\(username)&pw=\(password)"
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            (data, response, error) in
            if error != nil{
                print("error=\(error)")
                return
            }else {
                print("Data downloaded")
                self.getData(data!)
            }

        }
        
        task.resume()
        
    }
    
    func getData(_ data:Data) {
        
        let location = urpwModal()
        
        var jsonResult: String
    
        jsonResult =  String(data: data, encoding: String.Encoding.utf8)!
        
        location.result = jsonResult
        
        print("In check, \(location.description)")
    

    }
    
}
