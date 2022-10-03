//
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//
import SwiftUI
import MapKit

struct InsetMapView: View {
  // MARK: - PROPERTIES
  
    //центр карты и зона охвата
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 59.93104, longitude: 30.36133), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

  // MARK: - BODY

  var body: some View {
    Map(coordinateRegion: $region)
      .overlay(
        NavigationLink(destination: MainView()) {
          HStack {
            Image(systemName: "mappin.circle")
              .foregroundColor(Color.white)
              .imageScale(.large)
            
            Text("Locations")
              .foregroundColor(Color("AccentColor"))
              .fontWeight(.bold)
          } //: HSTACK
          .padding(.vertical, 10)
          .padding(.horizontal, 14)
          .background(
            Color.black
              .opacity(0.4)
              .cornerRadius(8)
          )
        } //: NAVIGATION
        .padding(12)
        , alignment: .topTrailing
      )
      .frame(height: 256)
      .cornerRadius(12)
  }
}

// MARK: - PREVIEW

struct InsetMapView_Previews: PreviewProvider {
  static var previews: some View {
    InsetMapView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
