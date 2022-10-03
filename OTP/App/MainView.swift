//
//  MainView.swift
//  OTP
//
//  Created by IvanTuly on 01/02/22.
//  Copyright © 2022 IvanTuly. All rights reserved.
//


import SwiftUI
import MapKit

struct MainView: View {
    // MARK: - PROPERTIES
    
    @State private var region: MKCoordinateRegion = {
      var mapCoordinates = CLLocationCoordinate2D(latitude: 59.93104, longitude: 30.36133)
      var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 0.45, longitudeDelta: 0.45)
      var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
      
      return mapRegion
    }()
    
    let locations: [Wash] = Bundle.main.decode("washs.json")
    
    // MARK: - BODY
    
    var body: some View {

        //Определяем вид иконки на карте и переход к детальной информации по нажатию
    NavigationView{

     Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: locations, annotationContent: { item in
        
        MapAnnotation(coordinate: item.location) {
            NavigationLink(destination: WashDetailView(wash: item)){
                MapAnnotationView(location: item)
            }//Navigation
            
        }
      })  //: MAP
            .navigationBarTitle("Автомойки Lion", displayMode: .inline)
    }
        
    /*  .overlay(
        HStack(alignment: .center, spacing: 12) {
          Image("compass")
            .resizable()
            .scaledToFit()
            .frame(width: 48, height: 48, alignment: .center)
          
          VStack(alignment: .leading, spacing: 3) {
            HStack {
              Text("Latitude:")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
              Spacer()
              Text("\(region.center.latitude)")
                .font(.footnote)
                .foregroundColor(.white)
            }
            
            Divider()
            
            HStack {
              Text("Longitude:")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
              Spacer()
              Text("\(region.center.longitude)")
                .font(.footnote)
                .foregroundColor(.white)
            }
          }
        } //: HSTACK
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(
          Color.black
            .cornerRadius(8)
            .opacity(0.6)
        )
        .padding()
        , alignment: .top
      ) */
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
      MainView()
        .previewDevice("iPhone 12 Pro")
    }
}
