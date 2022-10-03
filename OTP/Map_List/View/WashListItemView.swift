//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//
import SwiftUI

struct WashListItemView: View {
  // MARK: - PROPERTIES
  
  let wash: Wash

  // MARK: - BODY

  var body: some View {
    HStack(alignment: .center, spacing: 16) {
      Image(wash.image)
        .resizable()
        .scaledToFill()
        .frame(width: 90, height: 90)
        .clipShape(
          RoundedRectangle(cornerRadius: 12)
        )
      
      VStack(alignment: .leading, spacing: 8) {
        Text(wash.name)
          .font(.title)
          .fontWeight(.heavy)
          .foregroundColor(Color("AccentColor"))
        
        Text(wash.headline)
          .font(.footnote)
          .multilineTextAlignment(.leading)
          .lineLimit(2)
          .padding(.trailing, 8)
      } //: VSTACK
    } //: HSTACK
  }
}

// MARK: - PREVIEW

struct WashListItemView_Previews: PreviewProvider {
  static let washs: [Wash] = Bundle.main.decode("washs.json")
  
  static var previews: some View {
      WashListItemView(wash: washs[1])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
