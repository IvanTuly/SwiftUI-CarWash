//
//  ContentView.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem({
                    Image(systemName: "map.circle")
                    Text("Карта")
                })
            ListView()
                .tabItem({
                    Image(systemName: "list.bullet.circle")
                    Text("Список")
                })
            NewsView()
                .tabItem({
                    Image(systemName: "newspaper")
                    Text("Новости")
                })
            LoginView()
                .tabItem({
                    Image(systemName: "person")
                    Text("Аккаунт")
                })
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color("AccentColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


