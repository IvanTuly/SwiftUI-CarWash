//
//  ScndPage.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import SwiftUI
import Firebase

struct ScndPage : View {
    
    @State var code = ""
    @Binding var show : Bool
    @Binding var ID : String
    @State var msg = ""
    @State var alert = false
    @State var creation = false
    @State var loading = false
    @FocusState private var phoneIsFocused: Bool
    
    var body : some View{
        
        ZStack(alignment: .topLeading) {
            
            GeometryReader{_ in
                
                VStack(spacing: 20){
                    
                    Image("pic")
                    
                    Text("Код подтверждения").font(.largeTitle).fontWeight(.heavy)
                    
                    Text("Пожалуйста, введите код подтверждения.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.top, 12)
                    HStack(alignment: .center){
                    TextField("Код", text: self.$code)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color("Color1"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.top, 15)
                            .focused($phoneIsFocused)
                    Button("Готово") {
                        phoneIsFocused = false
                    }
                 }//Hstack
                    
                    if self.loading{
                        
                        HStack{
                            
                            Spacer()
                            
                            Indicator()
                            
                            Spacer()
                        }
                    }
                    
                    else{
                        
                        Button(action: {
                             
                            self.loading.toggle()
                        
                            let credential =  PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: self.code)
                             
                             Auth.auth().signIn(with: credential) { (res, err) in
                                 
                                 if err != nil{
                                     
                                     self.msg = (err?.localizedDescription)!
                                     self.alert.toggle()
                                     self.loading.toggle()
                                     return
                                 }
                     
                                 checkUser { (exists, user, uid, pic, about) in
                                     
                                     if exists{
                                         
                                         UserDefaults.standard.set(true, forKey: "status")
                                         
                                         UserDefaults.standard.set(user, forKey: "UserName")
                                         
                                         UserDefaults.standard.set(uid, forKey: "UID")
                                         
                                         UserDefaults.standard.set(pic, forKey: "pic")
                                         
                                         UserDefaults.standard.set(about, forKey: "about")
                                         
                                         NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                     }
                                     
                                     else{
                                         
                                         self.loading.toggle()
                                         self.creation.toggle()
                                     }
                                 }
                                 
                                 
                             }
                             
                         }) {
                             
                             Text("Подтвердить").frame(width: UIScreen.main.bounds.width - 30,height: 50)
                             
                         }.foregroundColor(.white)
                         .background(Color("AccentColor"))
                         .cornerRadius(10)
                    }
                    
                }
                
            }
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                
                Image(systemName: "chevron.left").font(.title)
                
            }.foregroundColor(Color("AccentColor"))
            
        }
        .padding()
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        //нажание на любую область Vstack скрывает клавиатуру
        .onTapGesture {
                    hideKeyboard()
            }
        .alert(isPresented: $alert) {
                
            Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
        }
        .sheet(isPresented: self.$creation) {
            
            AccountCreation(show: self.$creation)
        }
    }
}


