//
//  HomeScreenView.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import SwiftUI

struct VHomeScreen: View {
    @ObservedObject var repoEvents = REPOEvents()
    var body: some View {
        NavigationView {
            ZStack {
                if !repoEvents.events.isEmpty {
                    VEventList(repoEvents: repoEvents)
                } else {
                    VSplashScreen()
                }
            }
            .animation(.easeInOut)
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
