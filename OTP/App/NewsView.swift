//
//  NewsView.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        
        let news: [News] = Bundle.main.decode("news.json")
        
        //MARK: - BODY
        
        NavigationView {
            List{
                ForEach(news) { new in
                    NavigationLink(destination: NewsDetailView(news: new)) {
                        NewsListItemView(news: new)
                    } //:Link
                }//:Loop
            }
            .navigationBarTitle("Новости", displayMode: .automatic) 
        } //:Navigation
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
