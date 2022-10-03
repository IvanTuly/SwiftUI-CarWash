//
//  FirstPage.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//
import SwiftUI
import Firebase

struct FirstPage : View {
    
    @State var ccode = ""
    @State var no = ""
    @State var show = false
    @State var msg = ""
    @State var alert = false
    @State var ID = ""
    @FocusState private var phoneIsFocused: Bool
    
    var body : some View{
        
        VStack(spacing: 20){
            
            Image("pic")
            
            Text("Укажите номер").font(.largeTitle).fontWeight(.heavy)
            
            Text("Введите номер, для подтверждения")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 12)
            
            HStack{
                
                TextField("+7", text: $ccode)
                    .keyboardType(.numberPad)
                    .frame(width: 45)
                    .padding()
                    .background(Color("Color1"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .focused($phoneIsFocused)
                   
                
                TextField("(900)900-90-90", text: $no)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color("Color1"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .focused($phoneIsFocused)
                Button("Готово") {
                    phoneIsFocused = false
                }

                
            } .padding(.top, 15)

            NavigationLink(destination: ScndPage(show: $show, ID: $ID), isActive: $show) {
                
                
                Button(action: {
                    
                    // remove this when testing with real Phone Number
                    
                    Auth.auth().settings?.isAppVerificationDisabledForTesting = true
                    PhoneAuthProvider.provider().verifyPhoneNumber("+"+self.ccode+self.no, uiDelegate: nil) { (ID, err) in
                        
                        if err != nil{
                            
                            self.msg = (err?.localizedDescription)!
                            self.alert.toggle()
                            return
                        }
                        
                        self.ID = ID!
                        self.show.toggle()
                    }
                    
                    
                }) {
                    
                    Text("Отправить").frame(width: UIScreen.main.bounds.width - 30,height: 50)
                    
                }.foregroundColor(.white)
                .background(Color("AccentColor"))
                .cornerRadius(10)
            }

            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }.padding()
            .onTapGesture {
                        hideKeyboard()
                }
        .alert(isPresented: $alert) {
                
            Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
        }
    }
}

// расширение, позволяющее скрыть клавиатуру, по нажатии на экран
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
