//
//  HomeScreenView.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import SwiftUI

struct VHomeScreen: View {
    @ObservedObject var repoEvents = REPOEvents()
    @ObservedObject var coreUserData = CoreUserData()
    
    @Environment(\.managedObjectContext) var persistenceController
    
    var body: some View {
        NavigationView {
            ZStack {
                if repoEvents.events != nil && coreUserData.favoredEvents != nil {
                    VEventList(repoEvents: repoEvents)
                        .animation(.easeInOut)
                } else {
                    VSplashScreen()
                        .transition(.flipFromBottom)
                }
            }
        }
        .environmentObject(coreUserData)
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
