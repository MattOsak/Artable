//
//  Extensions.swift
//  Artable
//
//  Created by Matt Osak on 2019-07-13.
//  Copyright © 2019 Matt Osak. All rights reserved.
//

import Foundation
import Firebase

extension String {
    var isNotEmpty : Bool {
        return !isEmpty
    }
}

extension UIViewController {
    
    
    func simpleAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
