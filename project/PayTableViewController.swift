//
//  PayTableViewController.swift
//  project
//
//  Created by SWUCOMPUTER on 2017. 12. 23..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class PayTableViewController: UITableViewController {

    var dollars: [NSManagedObject] = []
    var totalCOunt: [Int] = [0,0,0]
    var currentSection = 0
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let context = self.getContext()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Dollar")
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            dollars = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        totalCOunt = [0,0,0]
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dollars.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Money Cell", for: indexPath)

        let dollar = dollars[indexPath.row]
        let income = dollar.value(forKey: "income") as? String
        
        var display : String = " "
        
        let dbDate: Date? = dollar.value(forKey: "date") as? Date
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "MM-dd h:mm a"
        if let unwrapDate = dbDate {
            let displayDate = formatter.string(from: unwrapDate as Date)
            cell.textLabel?.text = displayDate
        }
        
        if let option = dollar.value(forKey: "option") as? String {
            display = option+" "
        }
        if let income = dollar.value(forKey: "income") as? String {
            display = display+income+"원"
        }
        cell.detailTextLabel?.text = display
        
        
        if currentSection == indexPath.section {
            totalCOunt[currentSection] += Int(income!)!
        }
        else {
            currentSection = indexPath.section
            totalCOunt[currentSection] = Int(income!)!
        }
 
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "총 예산 \(totalCOunt[section])원"
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = getContext()
            context.delete(dollars[indexPath.row])
            
            do{
                try context.save()
                print("deleted")
            }catch let error as NSError {
                print("could not delete \(error)")
            }
            
            dollars.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            totalCOunt.remove(at: indexPath.section)
            
            self.tableView.reloadData()

        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            if let destination = segue.destination as? deptViewController {
                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row {
                    destination.detail = dollars[selectedIndex]
                }
            }
        }

    }

}
