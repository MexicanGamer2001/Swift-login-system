//
//  ViewController.swift
//  Login
//
//  Created by Eleazar Contreras on 12/15/18.
//  Copyright © 2018 Eleazar Contreras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var location = urpwModal()
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var btn: UIButton!
    
    
    
    @IBAction func logIn(_ sender: Any) {
        
        let ur: String = "\(username.text!)"
        let pw: String = "\(password.text!)"
        
        
        if(ur.isEmpty || pw.isEmpty)
        {
            // Display an alert message
            let myAlert = UIAlertController(title: "Alert", message:"All fields are required to fill in", preferredStyle: UIAlertController.Style.alert);
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
            myAlert.addAction(okAction);
            self.present(myAlert, animated: true, completion: nil)
            return
        }
        
    
       let request = NSMutableURLRequest(url: NSURL(string: "http://serenity.ist.rit.edu/~ec8155/Test/XCODEPROJECT/logSwift/login.php")! as URL)
        
        request.httpMethod = "POST"
        
        let postString = "user=\(ur)&pw=\(pw)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            (data, response, error) in
            if error != nil{
                print("error=\(String(describing: error))")
                return
            }
            
            
            
            print("response = \(response!)")
            print("==================================")
            
  
            //Let's convert response sent from a server side script to a NSDictionary object:
            do{
              let json = try  JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                if  let ssid = json["error"]  as? String{
                    print(ssid)
                    if ssid == "true"{
                        if  let pass = json["message"]  as? String{
                            print(pass)
                            self.location = urpwModal(result:ssid, message: pass)
                          
                            
                        }
                    } else{
                        if  let pass = json["user"]  as? String, let pas = json["pw"]  as? String {
                            print(pass, pas)
                            
                            self.location = urpwModal(result:ssid, user: pass, pw:pas)
                            
                        }
                    }
                    
                }
                

                
            } catch let error as NSError{
                print(error)
            }
            
            DispatchQueue.main.async {
             
                print(self.location.user, self.location.pw)
                
                print(ur, pw)
                
                if (self.location.user != ur) && (self.location.pw != pw) {
                    
                    // Display an alert message
                    let myAlert = UIAlertController(title: "Alert", message: self.location.message, preferredStyle: UIAlertController.Style.alert);
                    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
                    myAlert.addAction(okAction);
                    self.present(myAlert, animated: true, completion: nil)
                    return
                    

                    
                }else{
                    let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    
                    appDelegate.window?.rootViewController = tabBarController
                    
                }
            }
            
        }
        
        task.resume()
        
       
        
        /*
        self.check()
        self.login()
        
        
        
        if (username.text?.contains("admin"))! && (password.text?.contains("123"))!{
            print("success")
            
            let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
    
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = tabBarController
        
        }else{
            print("not success")
        }
        
        let message = "yes"
 
 
        let alertController = UIAlertController(title: "\(message)" , message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        */
 
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

   /*
    func login()  {
        
        let location = urpwModal()
        print("In login \(location.description)")

        let result = location.result
        
        if self.username.text == "" || self.password.text == ""{
            print("Please Enter some Text")
        } else if ((result?.range(of: "Email or Password is wrong.")) != nil){
             print("Error")
        }else{
            print("successful")
        }
        
        username.text = "username"
        password.text = "password"
        
    }
    
    func check(){
        let ur: String = "\(username.text!)"
        let pw: String = "\(password.text!)"
        
        let checkUPnPW =  checkURPW()
        
        checkUPnPW.downloadItems(username: ur, password: pw)
        let location = urpwModal()
        print("In VC \(location.description)")
    }
*/
}

