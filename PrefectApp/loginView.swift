//
//  loginView.swift
//  PrefectApp
//
//  Created by Home on 14/10/2016.
//  Copyright © 2016 Royce Yu. All rights reserved.
//

import UIKit
import Firebase

class loginView: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: UIButton)
    {
        self.login()
    }
    
    func login()
    {
        FIRAuth.auth()?.signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil
            {
                print("Incorrect Email/Password")
            }
            else
            {
                self.performSegue(withIdentifier: "Login", sender: self)
            }
        }
    }
}
