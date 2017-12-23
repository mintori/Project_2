//
//  ViewController.swift
//  project
//
//  Created by SWUCOMPUTER on 2017. 12. 23..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet var map: MKMapView!
    
    var selectedIndex: Int? = nil
    var ban: Bank? = nil
    var bankAnnotation: Bank? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    { super.viewWillAppear(animated)
        if let _ = selectedIndex {
            map.setRegion(MKCoordinateRegionMake((self.ban?.coordinate)!,MKCoordinateSpanMake(0.007, 0.007)), animated: true)
        }
        // 기존의 맵에 annotation이 있었다면 삭제
        if let annotation = bankAnnotation {
            self.map.removeAnnotation(annotation) }
        // 새로운 annotation 위치가 있다면 추가
        if let annotation = ban {
            self.bankAnnotation = annotation
            self.map.addAnnotation(self.bankAnnotation!)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toBankView"
        {
            if let destVC = segue.destination as? mapTableViewController
            {
                destVC.mainVC = self
            }
        }
    }
    
    @IBAction func updateMap(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.map.mapType = MKMapType.standard
        case 1:
            self.map.mapType = MKMapType.satellite
        default:
            self.map.mapType = MKMapType.hybrid
        }
    }
}

