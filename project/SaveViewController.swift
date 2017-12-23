//
//  SaveViewController.swift
//  project
//
//  Created by SWUCOMPUTER on 2017. 12. 23..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class SaveViewController: UIViewController {
    
    @IBOutlet var textCo: UITextView!
    @IBOutlet var textMoney: UITextField!
    
    var money: [NSManagedObject] = []
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textMoney.text = "0"
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Dollar", in: context)
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        object.setValue(sender.titleLabel?.text, forKey: "option")
        object.setValue(textMoney.text, forKey: "income")
        object.setValue(textCo.text, forKey: "memo")
        object.setValue(NSDate(), forKey: "date")
        
        do {
            try context.save()
            print("option saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
