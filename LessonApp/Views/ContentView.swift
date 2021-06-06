//
//  ContentView.swift
//  LessonApp
//
//  Created by Callum Day Ham on 6/4/21.
//

import SwiftUI

struct ContentView: View{
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View{
        
        ScrollView{
            
            LazyVStack{
                
                if model.currentModule != nil{
                    
                    ForEach(0..<model.currentModule!.content.lessons.count){ index in
                        
                        NavigationLink(
                            destination:
                                ContentDetialView()
                                        .onAppear(perform: {
                                            model.beginLesson(index)
                                        }),
                            label: {
                                
                                ContentViewRow(index: index)
                            })
                        }
                }
            }
            .accentColor(.black)
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}
