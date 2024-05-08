//
//  OIAProjApp.swift
//  OIAProj
//
//  Created by Swayam Rustagi on 04/05/24.
//

import SwiftUI

@main
struct OIAProjApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OIAHomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
