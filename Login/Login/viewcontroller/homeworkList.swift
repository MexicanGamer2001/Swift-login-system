//
//  homeworkList.swift
//  Login
//
//  Created by Eleazar Contreras on 12/17/18.
//  Copyright © 2018 Eleazar Contreras. All rights reserved.
//

import UIKit

class homeworkList: UITableView, UITableViewDelegate, HomeWorkModelProtocol  {
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : homeworkSend = homeworkSend()
    @IBOutlet weak var listTableView: UITableView!
    
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: homeworkSend = feedItems[indexPath.row] as! homeworkSend
        // Get references to labels of cell
        myCell.textLabel!.text = item.description
        
        return myCell
    }


}
