//
//  RegisterViewController.swift
//  Employee App
//
//  Created by unthinkable-mac-0025 on 14/04/21.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController {

    let realm = try! Realm()
    
    var details = Details()
    
    @IBOutlet weak var employeeIDTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var organizationTextField: UITextField!

    @IBOutlet weak var createBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createBtn.layer.cornerRadius = 20
        createBtn.titleEdgeInsets = UIEdgeInsets.init(top: 5,left: 5,bottom: 5,right: 5)
    }
    

    @IBAction func createAccountBtn(_ sender: UIButton) {
        details.id = Int(employeeIDTextField.text!) ?? 0
        details.name = nameTextField.text ?? "Nil"
        details.email = emailTextField.text ?? "Nil"
        details.organization = organizationTextField.text ?? "Nil"
        
        employeeIDTextField.text = ""
        nameTextField.text = ""
        emailTextField.text = ""
        organizationTextField.text = ""
        
        //creating an alert
        let alert = UIAlertController(title: "Registered Succesfully", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .default) { (action) in
            
            do{
                try self.realm.write{
                    self.realm.add(self.details)
                }
            }catch{
                print("Error while Saving Data\(error)")
            }
        }
        //presenting the alert in the screen
        alert.addAction(action)
        present(alert, animated: true, completion:  nil)
        
    }
    
}

