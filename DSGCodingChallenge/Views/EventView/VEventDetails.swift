//
//  EventDetailsView.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct VEventDetails: View {
    var event: VMEventDetails
    @State var favored = false
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: event.imageString))
                    .resizable()
                    .placeholder(Image(systemName: "photo"))
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(event.date)
                        .bold()
                        .font(.title)
                    Text(event.location)
                        .foregroundColor(.gray)
                        .font(.title2)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
            }
        }
        .navigationTitle(event.title)
        .navigationBarItems(trailing: Button(
        action: {
            favored.toggle()
            //Add persistence
        }, label: {
            if favored {
                Image("heart.fill")
            } else {
                Image("heart")
            }
        }))
    }
}

struct VEventDetails_Previews: PreviewProvider {
    static var previews: some View {
        VEventDetails(event: VMEventDetails(title: "Beastie Boys", imageString: "https://chairnerd.global.ssl.fastly.net/images/bandshuge/band_266.jpg", location: "Location", date: "Date"))
    }
}
