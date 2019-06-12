//
//  viewPersonal.swift
//  Login
//
//  Created by Eleazar Contreras on 12/17/18.
//  Copyright © 2018 Eleazar Contreras. All rights reserved.
//

import UIKit

class viewPersonal: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeWorkModelProtocol{
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : homeworkSend = homeworkSend()
    @IBOutlet weak var listTableView: UITableView!
    
    @IBOutlet weak var hwlabel: UILabel!
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: homeworkSend = feedItems[indexPath.row] as! homeworkSend
      
        // Get references to labels of cell
        myCell.textLabel!.text = item.description
    
        
        return myCell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let homework = homeworkData()
        homework.delegate = self
        homework.downloadItems()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
