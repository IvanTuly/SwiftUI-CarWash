//
//  NewsLinkView.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//


import SwiftUI

struct NewsLinkView: View {
  // MARK: - PROPERTIES
  
  let news: News

  // MARK: - BODY

  var body: some View {
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("Интеренет ресурс")
        Spacer()
        
        Group {
          Image(systemName: "link.circle")
          
          Link(news.title, destination: (URL(string: news.link) ?? URL(string: "https://vigeo.org"))!)
        }
        .foregroundColor(Color("AccentColor"))
      } //: HSTACK
    } //: BOX
  }
}

// MARK: - PREIVEW

struct NewsLinkView_Previews: PreviewProvider {
  static let news: [News] = Bundle.main.decode("news.json")
  
  static var previews: some View {
      NewsLinkView(news: news[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
