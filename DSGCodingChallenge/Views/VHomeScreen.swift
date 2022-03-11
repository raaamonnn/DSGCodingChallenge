//
//  HomeScreenView.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import SwiftUI

struct VHomeScreen: View {
    
    @State var retrievedData = false
    @State var events: [VMEventListItem]? = nil
    var body: some View {
        ZStack {
            if events != nil {
                Text("ASD")
                VEventList(events: events!)
            } else {
                VSplashScreen()
            }
        }
        .animation(.easeInOut)
        .onAppear {
            SVCSeatGeek.getEvents(eventName: "") { result in //weak self?
                switch result {
                case .success(let eventsModel):
                    for event in eventsModel.events {
                        events?.append(VMEventListItem(event: event))
                    }
                    retrievedData.toggle()
                case .failure(let error):
                    print("VHomeScreen \t Error retrieving Events \(error)")
                }
            }
        }
    }
}

struct VSplashScreen: View {
    var body: some View {
        VStack {
            Spacer()
            Text("DSG Coding Challenge")
                .bold()
                .font(.title)
            Spacer()
        }
    }
}
