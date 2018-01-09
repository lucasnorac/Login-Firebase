//
//  SignUpVC.swift
//  Login Firebase
//
//  Created by Lucas Caron Albarello on 14/12/17.
//  Copyright © 2017 Lucas Caron Albarello. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class SignUpVC: UIViewController {

    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var senhaTF: UITextField!


    @IBAction func cadastrar(_ sender: UIButton) {
        guard let usuario = userTF.text,
        usuario != "",
        let email = emailTF.text,
        email != "",
        let senha = senhaTF.text,
        senha != ""
    else { AlertController.showAlert(self, title: "Erro de Cadastro", message: "Por favor preencha tudo")
         return
        }
        Auth.auth().createUser(withEmail: email, password: senha) { (user, error) in
            guard error == nil else{
                AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                return
            }
            guard let user = user else { return}
            print(user.email ?? "EMAIL PERDIDO")
            print(user.uid)
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = usuario
            changeRequest.commitChanges(completion: { (error) in
                guard  error == nil else {
                    AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                    return
                }
                self.performSegue(withIdentifier: "cadastroSegue", sender: nil)
            })
        }
    }
    


}
