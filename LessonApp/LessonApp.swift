//
//  LessonApp.swift
//  LessonApp
//
//  Created by Callum Day Ham on 6/3/21.
//

import SwiftUI

@main
struct LessonApp: App{
    
    var body: some Scene{
       
        WindowGroup{
            
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
