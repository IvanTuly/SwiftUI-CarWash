//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import SwiftUI

struct InsetGalleryView: View {
  // MARK: - PROPERTIES
  
  let wash: Wash
  
  // MARK: - BODY

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 15) {
        ForEach(wash.gallery, id: \.self) { item in
          Image(item)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .cornerRadius(12)
        } //: LOOP
      } //: HSTACK
    } //: SCROLL
  }
}

// MARK: - PREVIEW

struct InsetGalleryView_Previews: PreviewProvider {
  static let washs: [Wash] = Bundle.main.decode("washs.json")
  
  static var previews: some View {
    InsetGalleryView(wash: washs[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
