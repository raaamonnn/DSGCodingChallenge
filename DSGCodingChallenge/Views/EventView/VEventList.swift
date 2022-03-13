//
//  VEventList.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import SwiftUI

struct VEventList: View {
    @ObservedObject var repoEvents: REPOEvents
    @State private var searchText = ""
    
    init(repoEvents: REPOEvents) {
        self.repoEvents = repoEvents
    }
    
    var body: some View {
        ScrollView {
            SearchBar(placeholder: "Search", text: $searchText)
                .padding(.horizontal, 8)
                .onChange(of: searchText) { (eventSearch) in
                    repoEvents.updateEvents(with: eventSearch)
                }
            
            LazyVStack {
                if repoEvents.events != nil {
                    ForEach(repoEvents.events!) { event in
                        VEventListItem(event: event)
                            .frame(height: 100, alignment: .leading)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 8)
                            .transition(.opacity)
                            .accessibility(identifier: "\(event.id)")
                    }
                }
            }
        }
        .navigationTitle("Events")
    }
}
