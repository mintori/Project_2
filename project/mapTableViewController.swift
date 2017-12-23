//
//  UnivTableViewController.swift
//
//
//
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class mapTableViewController: UITableViewController {
    
    var Banks: [Bank] = []
    var mainVC: ViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var ban: Bank
        ban = Bank(title:"신한은행", latitude:37.5639610, longitude:127.0897)
        self.Banks.append(ban)
        ban = Bank(title: "국민은행", latitude:37.5638740, longitude:126.9820660)
        self.Banks.append(ban)
        ban = Bank(title: "양평농협은행", latitude:37.4901350, longitude:127.4892740)
        self.Banks.append(ban)
        ban = Bank(title: "여주우리은행", latitude:37.2949190, longitude:127.6367170)
        self.Banks.append(ban)
        ban = Bank(title: "USABank", latitude:39.4154710, longitude:-119.2246070)
        self.Banks.append(ban)
        ban = Bank(title: "NewYorkBank", latitude:40.7127750, longitude:-74.0059730)
        self.Banks.append(ban)
        ban = Bank(title: "광주은행", latitude:35.0128290, longitude:126.7965930)
        self.Banks.append(ban)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "은행를 선택하세요"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Banks.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.mainVC?.selectedIndex = indexPath.row
        self.mainVC?.ban = self.Banks[indexPath.row]
        self.tableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Bank Cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = self.Banks[indexPath.row].title
        if let view = self.mainVC
        {
            if let index = view.selectedIndex {
                if index == indexPath.row {
                    cell.accessoryType = .checkmark }
                else {
                    cell.accessoryType = .none }
            }
        }
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
