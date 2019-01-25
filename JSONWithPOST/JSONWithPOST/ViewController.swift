//
//  ViewController.swift
//  JSONWithPOST
//
//  Created by kireeti on 30/11/18.
//  Copyright © 2018 KireetiSoftSolutions. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    

    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        loginServiceCall()
       SecondMethod()
        postMethod()
        isEvenNumber(number: 10) { (result) in
            print(result)
        }

    }
//Using Almofire
    func loginServiceCall() {
        
        
        let urlStr = "https://wmsservices.staging.cargoquin.com/Photos/LogOn"
        let _headers : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        let params : Parameters = [ "userId" : "admin","PWD" : "20B00FDF52978D3DB095A3D07B645C2A"]
        
        let url =  URL.init(string: urlStr)
        
        request(url!, method: .post, parameters: params, encoding: URLEncoding.httpBody , headers: _headers).responseJSON { (response) in
            
            let jsonResponse = response.result.value as! NSDictionary
            print("jsonResponse---------->",jsonResponse)
            if jsonResponse["Status"] != nil
            {
              let  Status = String(describing: jsonResponse["Status"]!)
                print("Status----->",Status)
            }
            
        }

    }
    func SecondMethod(){
        let params: NSMutableDictionary = ["userId" : "admin","PWD" : "20B00FDF52978D3DB095A3D07B645C2A"]
        APIManager.sharedInstance.postApIRequest(params: params) { (response, error) in
            print("response----------",response)
        }

    }
    
    
    func postMethod(){
        let url = URL(string: "https://wmsservices.staging.cargoquin.com/Photos/LogOn")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "userId=admin&PWD=20B00FDF52978D3DB095A3D07B645C2A"
        request.httpBody = postString.data(using: .utf8)
        _ = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString=========>", responseString!)
            
        }.resume()
    }
    

    // callbacks
    
    func isEvenNumber(number:Int, completionHandler: @escaping (Bool) -> Void){
        if(number % 2 == 0){
            completionHandler(true)
        }else {
            completionHandler(false)
        }
    }
    
    
    
    
}
