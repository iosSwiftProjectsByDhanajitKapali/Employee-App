//
//  LoginViewController.swift
//  Employee App
//
//  Created by unthinkable-mac-0025 on 14/04/21.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    var id : Int = 0

    let realm = try! Realm()
    var detailsResult : Results<Details>?
    
    @IBOutlet weak var detailsField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailsResult = realm.objects(Details.self)
        detailsResult = detailsResult?.filter("id == %@", id)
        
        let details = detailsResult?[0]
        
        var detailsText : String = " Employee ID = \(details!.id) \n Name = \(details!.name) \n Email = \(details!.email) \n Organization = \(details!.organization)"
        

        //print(detailsText)
        detailsField.text = detailsText
        
        

        
    }
    


}
