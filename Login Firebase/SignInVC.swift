//
//  SignInVC.swift
//  Login Firebase
//
//  Created by Lucas Caron Albarello on 14/12/17.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit
import Firebase
class SignInVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var senhaTF: UITextField!
  
    
    @IBAction func Login(_ sender: UIButton) {
        guard let email = emailTF.text,
            email != "",
            let senha = senhaTF.text,
            senha != ""
            else { AlertController.showAlert(self, title: "Erro de Cadastro", message: "Por favor preencha tudo")
                return
        }
        Auth.auth().signIn(withEmail: email, password: senha) { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else {return}
            print(user.email ?? "EMail Sumido")
            print(user.displayName ?? "Name sumido")
            print(user.uid)
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
}
