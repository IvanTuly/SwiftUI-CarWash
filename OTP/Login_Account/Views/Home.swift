//
//  Home.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//
import SwiftUI
import Firebase
//import SDWebImageSwiftUI

struct Home : View {
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.White
    }
    
  //  @State var myuid = UserDefaults.standard.value(forKey: "UserName") as! String
  //  @EnvironmentObject var datas : MainObservable
    @State private var darkMode = false
    
    var body : some View{
        GeometryReader { geo in
            VStack{
                HStack{
                    Spacer()
                Button(action: {
                    
                    try! Auth.auth().signOut()
                    
                    UserDefaults.standard.set(false, forKey: "status")
                    
                    NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                    
                }) {
                    
                    Text("Выход")
                }
                }//HStack
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 20))
            
            
            /* AnimatedImage(url: URL(string: UserDefaults.standard.value(forKey: "pic") as! String))
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width:  geo.size.width * 0.33, height:  geo.size.width * 0.33) */
                .clipShape(Circle())
            
            Text("Привет, \(UserDefaults.standard.value(forKey: "UserName") as! String) !")
                    .font(.title2)
                
            HStack {
                Text("Обо мне")
                    .font(.callout)
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: geo.size.width * 0.05, bottom: 0, trailing: 0))
                
            ScrollView {
                Text(UserDefaults.standard.value(forKey: "about") as! String)

                }//ScrollView
                .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.15, alignment: .topLeading)
                .offset(x: 5, y: 5)
                .background(Color("Color1"))
                .cornerRadius(5)
                
                
                List{
                    Button(action: {}){
                        HStack{
                            Text("Оплата")
                            Spacer()
                            Image(systemName: "arrow.right")
                        }//HStack
                    }
                    .foregroundColor(Color("Black"))
                    
                    Button(action: {}){
                        HStack{
                            Text("Бонусная программа")
                            Spacer()
                            Image(systemName: "arrow.right")
                        }//HStack
                    }
                    .foregroundColor(Color("Black"))
                    
                    Toggle("Темный режим", isOn: $darkMode)
                    .foregroundColor(Color("Black"))
                    
                    Button(action: {}){
                        HStack{
                            Text("О программе")
                    Spacer()
                            Image(systemName: "info")
                        }//HStack
                    }
                    .foregroundColor(Color("Black"))
                    
                    
                }//List
            } //VStack
        } //GeoReader
    }
}


extension UIColor {
    public class var White  : UIColor {
        return UIColor(named: "White")   ?? UIColor.white
    }

}


