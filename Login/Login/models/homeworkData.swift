//
//  homeworkData.swift
//  Login
//
//  Created by Eleazar Contreras on 12/17/18.
//  Copyright © 2018 Eleazar Contreras. All rights reserved.
//

import UIKit
import Foundation

protocol HomeWorkModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class homeworkData: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeWorkModelProtocol!
    
    var data = Data()
    
    let urlPath: String = "http://serenity.ist.rit.edu/~ec8155/Test/XCODEPROJECT/logSwift/homeworkGet.php" //this will be changed to the path where service.php lives
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            //print(jsonResult[0])
            
        } catch let error as NSError {
            print("Problem with downloading: ",error)
            
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            
            //print(jsonResult[i])
            jsonElement = jsonResult[i] as! NSDictionary
            
            let location = homeworkSend()
            //print(jsonElement["LastName"]!)
            //the following insures none of the JsonElement values are nil through optional binding
            if let homework = jsonElement["homework"] as? String,
                let due = jsonElement["due"] as? String
            {
                print("if")
                location.homework = homework
                location.due = due

                
            }
            
            locations.add(location)
            
            print(location.description)
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)
            
        })
    }
    
}
