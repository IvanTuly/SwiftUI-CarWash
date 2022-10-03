//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//
import SwiftUI

struct HeadingView: View {
  // MARK: - PROPERTIES
  
  var headingImage: String
  var headingText: String
  
  // MARK: - BODY

  var body: some View {
    HStack {
      Image(systemName: headingImage)
        .foregroundColor(Color("AccentColor"))
        .imageScale(.large)
      
      Text(headingText)
        .font(.title)
        .fontWeight(.bold)
    }
    .padding(.vertical)
  }
}

// MARK: - PREVIEW

struct HeadingView_Previews: PreviewProvider {
  static var previews: some View {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
