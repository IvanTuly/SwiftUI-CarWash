//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import SwiftUI

struct InsetFactView: View {
  // MARK: - PROPERTIES
  
  let wash: Wash

  // MARK: - BODY

  var body: some View {
    GroupBox {
      TabView {
        ForEach(wash.fact, id: \.self) { item in
          Text(item)
        }
      } //: TABS
      .tabViewStyle(PageTabViewStyle())
      .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
    } //: BOX
  }
}

// MARK: - PREVIEW

struct InsetFactView_Previews: PreviewProvider {
  static let washs: [Wash] = Bundle.main.decode("washs.json")
  
  static var previews: some View {
    InsetFactView(wash: washs[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
