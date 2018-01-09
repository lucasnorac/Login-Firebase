//
//  AlertController.swift
//  Login Firebase
//
//  Created by Lucas Caron Albarello on 14/12/17.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit
class AlertController {
    static func showAlert(_ inViewController: UIViewController, title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert, animated: true, completion: nil)
    }
}
