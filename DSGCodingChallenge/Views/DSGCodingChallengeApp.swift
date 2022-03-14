//
//  DSGCodingChallengeApp.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import SwiftUI

@main
struct DSGCodingChallengeApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            VHomeScreen()
        }
        //Save changes when app moves to background
        .onChange(of: scenePhase) { _ in
            PersistenceController.shared.save()
        }
    }
}
