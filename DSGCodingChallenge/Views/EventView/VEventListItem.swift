//
//  EventListItemView.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct VEventListItem: View {
    @ObservedObject var event: VMEventListItem
    @EnvironmentObject var coreUserData: CoreUserData
    
    var body: some View {
        NavigationLink (
            destination: VEventDetails(event: event)
                .navigationBarTitleDisplayMode(.inline),
            label: {
                ZStack {
                    Color(coreUserData.contains(favoredEventId: event.id) ? UIColor.init(.pink).withAlphaComponent(0.5) : .secondarySystemBackground)
                    HStack {
                        WebImage(url: URL(string: event.imageString ?? ""))
                            .placeholder {
                                Color(.brown)
                            }
                            .frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(12)
                            .padding(8)

                        VStack (alignment: .leading) {
                            Text(event.title)
                                .foregroundColor(Color.init(.label))
                                .bold()
                                .lineLimit(1)

                            Text(event.location)
                                .foregroundColor(Color.init(.label))
                                .lineLimit(1)

                            Text(event.date, style: .date)
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.gray)
                                .lineLimit(1)
                        }
                        Spacer()
                    }
                }
                .cornerRadius(12)
            })
    }
}
