//
//  EventListItemView.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct VEventListItem: View {
    var event: VMEventListItem
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
            HStack {
                WebImage(url: URL(string: event.imageString ?? ""))
                    .placeholder(Image(systemName: "photo"))
                    .cornerRadius(12)
                    .padding(8)
                    .scaledToFit()
                
                VStack (alignment: .leading){
                    Text(event.title)
                        .bold()
                        .lineLimit(1)
                    
                    Text(event.location)
                        .lineLimit(1)
                    
                    Text(event.date, style: .date)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                .padding(8)
                
                Spacer()
            }
        }
        .cornerRadius(12)
        .padding(.horizontal, 16)
        .frame(height: 100)
    }
}
