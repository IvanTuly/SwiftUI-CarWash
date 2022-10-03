//
//  List.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        //MARK: - PROPERTIES
        
        let washs: [Wash] = Bundle.main.decode("washs.json")
        
        //MARK: - BODY
        
        NavigationView {
            List{
                ForEach(washs) { wash in
                    NavigationLink(destination: WashDetailView(wash: wash)) {
                        WashListItemView(wash: wash)
                    } //:Link
                    
                    
                }//:Loop
            }
            .navigationBarTitle("Наши пункты", displayMode: .automatic)
        }
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
