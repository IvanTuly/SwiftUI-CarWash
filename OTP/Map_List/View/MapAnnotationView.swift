//
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import SwiftUI

struct MapAnnotationView: View {
  // MARK: - PROPERTIES
  
  var location: Wash
  
  // MARK: - BODY

  var body: some View {
    ZStack {
      Circle()
        .stroke(Color("Black"), lineWidth: 2)
        .frame(width: 52, height: 52, alignment: .center)

      
      Image("mapIcon")
        .resizable()
        .scaledToFit()
        .frame(width: 48, height: 48, alignment: .center)
        .clipShape(Circle())
    } //: ZSTACK

  }
}

// MARK: - PREVIEW

struct MapAnnotationView_Previews: PreviewProvider {
  static var locations: [Wash] = Bundle.main.decode("washs.json")
  
  static var previews: some View {
    MapAnnotationView(location: locations[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
