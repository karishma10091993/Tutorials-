//
//  AlertSingleton.swift
//  MOBOTICSTask
//
//  Created by Bharath Kumar on 7/6/18.
//  Copyright © 2018 brn. All rights reserved.
//

import UIKit

class AlertSingleton: NSObject {
    static let shared = AlertSingleton()
    override init() {
    }
    func showAlerts(title:String,message:String,target:UIViewController,responder:@escaping ()->Void)
    {
        let alerts = UIAlertController(title:title, message:message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: { (alert) in
            responder()
        })
        target.present(alerts, animated: true, completion: nil)
        alerts.addAction(okAction)
    }
}
