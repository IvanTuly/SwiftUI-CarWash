//
//  NewsDetailView.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import SwiftUI

struct NewsDetailView: View {
    // MARK: - PROPERTIES
    
    let news: News
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .center, spacing: 20) {
            // HERO IMAGE
            Image(news.image)
              .resizable()
              .scaledToFit()
            
            // TITLE
            Text(news.title.uppercased())
              .font(.largeTitle)
              .fontWeight(.heavy)
              .multilineTextAlignment(.center)
              .padding(.vertical, 8)
              .foregroundColor(.primary)
              .background(
                Color("AccentColor")
                  .frame(height: 6)
                  .offset(y: 24)
              )
            
            // HEADLINE
            Text(news.subtitle)
              .font(.headline)
              .multilineTextAlignment(.leading)
              .foregroundColor(Color("AccentColor"))
              .padding(.horizontal)
            
            // DESCRIPTION
            Group {
             // HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
              
              Text(news.text)
                .multilineTextAlignment(.leading)
                .layoutPriority(1)
            }
            .padding(.horizontal)
            
            
            // LINK
            Group {
              HeadingView(headingImage: "books.vertical", headingText: "Все о")
              
              NewsLinkView(news: news)
            }
            .padding(.horizontal)
          } //: VSTACK
          .navigationBarTitle("Больше информации \(news.title)", displayMode: .inline)
        } //: SCROLL
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static let news: [News] = Bundle.main.decode("news.json")
    
    static var previews: some View {
        NavigationView {
          NewsDetailView(news: news[0])
        }
        .previewDevice("iPhone 12 Pro")
        
    }
}
