//
//  Programming_Techniques_and_ApplicationsApp.swift
//  Programming Techniques and Applications
//
//  Created by Gordon Ng on 2022-05-13.
//

import SwiftUI

@main
struct Programming_Techniques_and_ApplicationsApp: App {
    var body: some Scene {
        WindowGroup {
            
            HomeView()
                .environmentObject(ContentModel()) //New instance of ContentModel
        }
    }
}
