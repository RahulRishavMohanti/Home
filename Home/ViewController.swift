//
//  ViewController.swift
//  Home
//
//  Created by Rahul Rishav Mohanti on 30/10/17.
//  Copyright © 2017 Rahul Rishav Mohanti. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    var lightstatus = "0";
    var fanstatus = "0";
    @IBOutlet var lightstoggle: UIButton!
    
    @IBAction func lightstoggle(_ sender: Any) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("led").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            self.lightstatus = value?["state"] as? String ?? ""
            if(self.lightstatus == "OFF")
            {ref.child("led").updateChildValues(["state":"ON"])}
            else{
                ref.child("led").updateChildValues(["state":"OFF"])
}

        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    @IBAction func fanstoggle(_ sender: Any) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("led").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            self.fanstatus = value?["state"] as? String ?? ""
            if(self.fanstatus == "OFF")
            {ref.child("led").updateChildValues(["state":"ON"])}
            else{
                ref.child("led").updateChildValues(["state":"OFF"])
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

