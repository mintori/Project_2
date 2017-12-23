//
//  deptViewController.swift
//  project
//
//  Created by SWUCOMPUTER on 2017. 12. 23..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class deptViewController: UIViewController {

    
    @IBOutlet var amount: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var option: UILabel!
    @IBOutlet var memo: UITextView!
    
    var detail: NSManagedObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let det = detail {
            amount.text = det.value(forKey: "income") as? String
            option.text = det.value(forKey: "option") as? String
            memo.text = det.value(forKey: "memo") as? String
            
            let dbDate: Date? = det.value(forKey: "date") as? Date
            //let displayTime = dbDate.description
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd h:mm a"
            if let unwrapDate = dbDate {
                let displayDate = formatter.string(from: unwrapDate as Date)
                date.text = displayDate
            }
        }
    }
}

