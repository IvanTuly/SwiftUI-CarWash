//
//  createUser.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import Foundation
import Firebase


func CreateUser(name: String,about : String,imagedata : Data,completion : @escaping (Bool)-> Void){
    
    let db = Firestore.firestore()
    
    let storage = Storage.storage().reference()
    
    let uid = Auth.auth().currentUser?.uid
    
    storage.child("profilepics").child(uid!).putData(imagedata, metadata: nil) { (_, err) in
        
        if err != nil{
            
            print((err?.localizedDescription)!)
            return
        }
        
        storage.child("profilepics").child(uid!).downloadURL { (url, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            db.collection("users").document(uid!).setData(["name":name,"about":about,"pic":"\(url!)","uid":uid!]) { (err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
                
                completion(true)
                
                UserDefaults.standard.set(true, forKey: "status")
                
                UserDefaults.standard.set(name, forKey: "UserName")
                
                UserDefaults.standard.set(uid, forKey: "UID")
                
                UserDefaults.standard.set("\(url!)", forKey: "pic")
                
                UserDefaults.standard.set(about, forKey: "about")
                
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            }
        }
    }
}
