//
//  App.swift
//  JSONWithPOST
//
//  Created by kireeti on 10/12/18.
//  Copyright © 2018 KireetiSoftSolutions. All rights reserved.
//


import UIKit


typealias CompletionHandler = (_ response : NSDictionary, _ error : Error?) -> Void

class APIManager {
    
    
    
    static let sharedInstance = APIManager()
    
    // Login API
   // http://m.agilechitfunds.com/ChitcareServices.svc/Login
    func postLoginAPIRequest( params : NSMutableDictionary, handler : @escaping CompletionHandler) {
        
        HttpClient.instance().makeAPICall(url: K_HOST_URL+K_LOGIN, params: (params as! Dictionary<String, Any>) , method: HttpMethod.POST, success: { (data, response, error) in
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary
                
                print("===================response================ = \(json)")
                
                let resssp = json
                handler(resssp,error)
                
            } catch let error as NSError {
                print(error)
                
                
                
            }
            
            
        }, failure: { (data, response, error) in
            
        })
        
    }
    //http://m.agilechitfunds.com/ChitcareServices.svc/BranchesFill
    func postBranchResultAPIRequest( params : NSMutableDictionary, handler : @escaping CompletionHandler) {
        
        HttpClient.instance().makeAPICall(url: K_HOST_URL+K_BRANCHFILL, params: (params as! Dictionary<String, Any>) , method: HttpMethod.POST, success: { (data, response, error) in
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary
                
                print("===================response================ = \(json)")
                
                let resssp = json
                handler(resssp,error)
                
            } catch let error as NSError {
                print(error)
                
                
                
            }
            
            
        }, failure: { (data, response, error) in
            
        })
        
    }
    //http://m.agilechitfunds.com/ChitcareServices.svc/CompanyInformation
    
    func postCustomInfoAPIRequest( params : NSMutableDictionary, handler : @escaping CompletionHandler) {
        
        HttpClient.instance().makeAPICall(url: K_HOST_URL+K_CUSTOMER_INFO, params: (params as! Dictionary<String, Any>) , method: HttpMethod.POST, success: { (data, response, error) in
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary
                
                print("===================response================ = \(json)")
                
                let resssp = json
                handler(resssp,error)
                
            } catch let error as NSError {
                print(error)
                
                
                
            }
            
            
        }, failure: { (data, response, error) in
            
        })
        
    }
}
