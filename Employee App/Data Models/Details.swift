//
//  Details.swift
//  Employee App
//
//  Created by unthinkable-mac-0025 on 14/04/21.
//

import Foundation
import RealmSwift

class Details: Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var name : String = ""
    @objc dynamic var email : String = ""
    @objc dynamic var organization : String = ""
    
}
