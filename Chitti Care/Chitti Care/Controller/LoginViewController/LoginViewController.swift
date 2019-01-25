//
//  ViewController.swift
//  Chitti Care
//
//  Created by kireeti on 14/12/18.
//  Copyright © 2018 KireetiSoftSolutions. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        loginParsing()
       // textFieldData()
        // Do any additional setup after loading the view, typically from a nib.
//        self.userNameTF.text = "kesselnadmins"
//        self.passwordTF.text = "@admin$essel#"
    }
//    func textFieldData(){
//        if userNameTF.text?.count == 0 {
//            AlertSingleton.shared.showAlerts(title: "Alert!", message: "Enter Valid Mail id", target: self) {
//                self.userNameTF.becomeFirstResponder()
//            }
//        }
//        if passwordTF.text?.count == 0 {
//            AlertSingleton.shared.showAlerts(title: "Alert!", message: "Enter Valid password id", target: self) {
//                self.passwordTF.becomeFirstResponder()
//            }
//        }
//    }
  
    
//        if userNameTF.text?.count != 0 || passwordTF.text?.count != 0 {
//            loginParsing()
//        }else{
//            AlertSingleton.shared.showAlerts(title: "Alert!", message: "Enter Valid Mail and password id", target: self) {
//                 self.userNameTF.becomeFirstResponder()
//                 self.passwordTF.becomeFirstResponder()
//            }}
//
   
    @IBAction func loginACtionBtn(_ sender: Any) {
   loginParsing()
}
    func loginParsing(){
        
            
            
            
            if userNameTF.text?.count == 0 && passwordTF.text?.count == 0 {
                
                
                    let alertView = UIAlertController(title: "", message: "Please enter username or pwd", preferredStyle: .alert)
                    
                    let action = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                        
                    })
                    alertView.addAction(action)
                    self.present(alertView, animated: true, completion: nil)
                
    
                
                
            }else{
                let params : NSMutableDictionary = ["UserName":userNameTF.text!,
                                                    "UserPwd":passwordTF.text!]
                print("\(params)")
                let params1 : NSMutableDictionary = ["LoginRequest":params]
                print("params1-----",params1)
                
                APIManager.sharedInstance.postLoginAPIRequest(params: params1) { (response, error) in
                    
                    print("response----",response)
                    let jsonData = response
                
                let loginResult = jsonData["LoginResult"] as! NSDictionary
                let result = loginResult["Result"] as! String
                UserDefaults.standard.set(loginResult.value(forKey: "UserID"), forKey: "User ID")
                    print("result------->",result)
                    if result == "Success"{
                    DispatchQueue.main.async {
                        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "NavigationController") as! NavigationController
                        var window = UIWindow()
                        var appDlegate = UIApplication.shared.delegate as! AppDelegate
                        appDlegate.window!.rootViewController = secondVC
                        window.makeKeyAndVisible()
                       // self.navigationController?.pushViewController(secondVC!, animated: true)
                        //present(secondVC!, animated: true, completion: nil)
                        }
                  
                        
                    }else{
                      print("Alert")
                }
          
        }

        
            
           
      
        
    }
    
    
    }
    
}

