//
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//

import SwiftUI

struct ExternalWeblinkView: View {
  // MARK: - PROPERTIES
  
  let wash: Wash

  // MARK: - BODY

  var body: some View {
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("Видео Трансляция")
        Spacer()
        
        Group {
          Image(systemName: "arrow.up.right.video")
          
          Link(wash.name, destination: (URL(string: wash.link) ?? URL(string: "https://vigeo.org"))!)
        }
        .foregroundColor(Color("AccentColor"))
      } //: HSTACK
    } //: BOX
  }
}

// MARK: - PREIVEW

struct ExternalWeblinkView_Previews: PreviewProvider {
  static let washs: [Wash] = Bundle.main.decode("washs.json")
  
  static var previews: some View {
    ExternalWeblinkView(wash: washs[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
