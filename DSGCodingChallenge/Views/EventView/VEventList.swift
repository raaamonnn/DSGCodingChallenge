//
//  VEventList.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import SwiftUI

struct VEventList: View {
    var events: [VMEventListItem]
    var body: some View {
        List {
            ForEach(events) { event in
                VEventListItem(event: event)
            }
        }
    }
}
