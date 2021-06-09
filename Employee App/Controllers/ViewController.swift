//
//  ViewController.swift
//  Employee App
//
//  Created by unthinkable-mac-0025 on 14/04/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    var id = 0
    let realm = try! Realm()
    
    @IBOutlet weak var registerBtnOutlet: UIButton!
    @IBOutlet weak var loginBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerBtnOutlet.layer.cornerRadius = 20
        loginBtnOutlet.layer.cornerRadius = 20
        registerBtnOutlet.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        loginBtnOutlet.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
       
    }

    
    @IBAction func registerBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRegister", sender: self)
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        
        var textField = UITextField()
        //creating an alert
        let alert = UIAlertController(title: "Enter Employee ID", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Login", style: .default) { (action) in
            
            let temp = textField.text!
            self.id = Int(temp)!
            self.idCheck(id: self.id)
            
        }
        //adding a texField in the alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter your ID"
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion:  nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails"{
            let destinationVC = segue.destination as! LoginViewController
            destinationVC.id = id
        }
    }
    
    func idCheck(id : Int)  {
        var detailsResult : Results<Details>!
        detailsResult = realm.objects(Details.self)
        detailsResult = detailsResult?.filter("id == %@", id)
        let size = detailsResult.count
        
        if size == 1{
            performSegue(withIdentifier: "goToDetails", sender: self)
        }else{
            let alert = UIAlertController(title: "Invalid Employee ID", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alert.addAction(action)
            present(alert, animated: true, completion:  nil)
        }
    }
}

