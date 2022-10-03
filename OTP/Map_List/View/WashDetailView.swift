//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import SwiftUI

struct WashDetailView: View {
  // MARK: - PROPERTIES
  
  let wash: Wash

  // MARK: - BODY

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        // HERO IMAGE
        Image(wash.image)
          .resizable()
          .scaledToFit()
        
        // TITLE
        Text(wash.name.uppercased())
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
        Text(wash.headline)
          .font(.headline)
          .multilineTextAlignment(.leading)
          .foregroundColor(.accentColor)
          .padding(.horizontal)
        
        // GALLERY
        Group {
          HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Галерея")
          
          InsetGalleryView(wash: wash)
        }
        .padding(.horizontal)
        
        // FACTS
        Group {
          HeadingView(headingImage: "questionmark.circle", headingText: "Что есть на пункте?")
          
          InsetFactView(wash: wash)
        }
        .padding(.horizontal)
        
        // DESCRIPTION
        Group {
          HeadingView(headingImage: "info.circle", headingText: "Все о \(wash.name)")
          
          Text(wash.description)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
        }
        .padding(.horizontal)
        
        // MAP
        Group {
          HeadingView(headingImage: "map", headingText: "Карта")
          
          InsetMapView()
        }
        .padding(.horizontal)
        
        // LINK
        Group {
          HeadingView(headingImage: "books.vertical", headingText: "Видеотрансляция")
          
          ExternalWeblinkView(wash: wash)
        }
        .padding(.horizontal)
      } //: VSTACK
      .navigationBarTitle("Все о \(wash.name)", displayMode: .inline)
    } //: SCROLL
  }
}

// MARK: - PREVIEW

struct WashDetailView_Previews: PreviewProvider {
  static let wash: [Wash] = Bundle.main.decode("washs.json")
  
  static var previews: some View {
    NavigationView {
        WashDetailView(wash: wash[0])
    }
    .previewDevice("iPhone 12 Pro")
  }
}
