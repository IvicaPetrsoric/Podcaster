//
//  UIViewController.swift
//  Podcaster
//
//  Created by Ivica Petrsoric on 27/06/2018.
//  Copyright © 2018 Ivica Petrsoric. All rights reserved.
//

import UIKit

extension UIViewController{
    
    enum AlertMessage: String{
        case errorWebConnection = "Check your Web connection!"
    }
    
    func showAllert(message: AlertMessage){
        let alert = UIAlertController(title: "Notice", message: message.rawValue, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
