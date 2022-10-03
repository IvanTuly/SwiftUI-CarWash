//
//  CheckUser.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import Foundation
import Firebase

func checkUser(completion: @escaping (Bool,String,String,String,String)->Void){
     
    let db = Firestore.firestore()
    
    db.collection("users").getDocuments { (snap, err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            return
        }
        
        for i in snap!.documents{
            
            if i.documentID == Auth.auth().currentUser?.uid{
                
                completion(true, i.get("name") as! String, i.documentID, i.get("pic") as! String, i.get("about") as! String)
                return
            }
        }
        
        completion(false,"","","","")
    }
    
}
