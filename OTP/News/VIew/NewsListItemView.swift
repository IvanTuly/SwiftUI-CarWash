//
//  NewsListItemView.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import SwiftUI

struct NewsListItemView: View {
    
    let news: News
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
          Image(news.image)
            .resizable()
            .scaledToFill()
            .frame(width: 90, height: 90)
            .clipShape(
              RoundedRectangle(cornerRadius: 12)
            )
          
          VStack(alignment: .leading, spacing: 8) {
            Text(news.title)
              .font(.title)
              .fontWeight(.heavy)
              .foregroundColor(Color("AccentColor"))
            
            Text(news.subtitle)
              .font(.footnote)
              .multilineTextAlignment(.leading)
              .lineLimit(2)
              .padding(.trailing, 8)
          } //: VSTACK
        } //: HSTACK
    }
}

struct NewsListItemView_Previews: PreviewProvider {
    static let news: [News] = Bundle.main.decode("news.json")
    
    static var previews: some View {
        NewsListItemView(news: news[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
