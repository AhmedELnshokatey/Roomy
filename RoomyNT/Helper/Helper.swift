//
//  Helper.swift
//  networklayer
//
//  Created by AhmedMohamedIOS on 8/6/19.
//  Copyright © 2019 AhmedMohamedIOS. All rights reserved.
//

import UIKit

class helper : NSObject{
    class func restartApp(){
        
        guard let window = UIApplication.shared.keyWindow else {return}
        
        
        
        let sB = UIStoryboard(name: "Main", bundle: nil)
        
        
        
        var vC : ViewController
        
        
        
        if helper.getApiToken() == nil
            
        {
            
            vC = sB.instantiateInitialViewController()! as! ViewController
            
        }
            
        else{
            
            vC = sB.instantiateViewController(withIdentifier: "TableViewC") as! ViewController
            
        }
        
        window.rootViewController = vC
        
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
        
        
        
    }
    class func saveToUserDef (auth_token : String){
        let def = UserDefaults.standard
        def.setValue(auth_token, forKey: "auth_token")
        def.synchronize()
        restartApp()
    
    }
    class func getApiToken () -> String?{
        
        let  def = UserDefaults.standard
        
        return def.object(forKey: "auth_token") as? String
        
        
    }
    
}
