//
//  EventDetailsView.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import SwiftUI
import SDWebImageSwiftUI
import CoreData

struct VEventDetails: View {
    var event: VMEventListItem
    @EnvironmentObject var coreUserData: CoreUserData
    
    private let dateFormatter: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        return dateFormatter
    }()
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: event.imageString ?? ""))
                    .resizable()
                    .placeholder {
                        Color(.brown)
                    }
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(event.date, formatter: dateFormatter)
                        .font(.title)
                        .bold()
                        .lineLimit(1)
                        .padding(.bottom, 1)
                        
                    Text(event.location)
                        .foregroundColor(.gray)
                        .bold()
                        .font(.headline)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
            }
        }
        .navigationTitle(event.title)
        .navigationBarItems(trailing: Button(
        action: {
            coreUserData.editFavoredEvents(eventId: event.id)
        }, label: {
            if coreUserData.contains(favoredEventId: event.id) {
                Image(systemName: "heart.fill")
                    .foregroundColor(.pink)
            } else {
                Image(systemName: "heart")
                    .foregroundColor(.pink)
            }
        }))
    }
}
