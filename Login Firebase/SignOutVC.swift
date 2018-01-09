//
//  SignOutVC.swift
//  Login Firebase
//
//  Created by Lucas Caron Albarello on 14/12/17.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit
import Firebase
class SignOutVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = Auth.auth().currentUser?.displayName else {return}
        label.text = "Hola \(user)"
    }

    @IBAction func sair(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "sairSegue", sender: nil)
        } catch  {
            print(error)
        }
    }
}
