//
//  HomeView.swift
//  LessonApp
//
//  Created by Callum Day Ham on 6/3/21.
//

import SwiftUI

struct HomeView: View{
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View{
        
        NavigationView{
            VStack(alignment: .leading){
                
                Text("Which Lesson to Work on Today?")
                    .padding(.leading, 18)
                
                ScrollView{
                    
                    LazyVStack{
                        
                        ForEach(model.modules){ module in
                            
                            VStack(spacing: 20){
                                
                                NavigationLink(destination: ContentView()
                                        .onAppear(perform:{model.beginModule(module.id)}),
                                               tag: module.id,
                                               selection: $model.currentContentSelected,
                                    label:{
                                        
                                        HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                    })
                                
                                HomeViewRow(image: module.test.image, title: "\(module.category) Quiz", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                            }
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider{
    
    static var previews: some View{
        
        HomeView()
            .environmentObject(ContentModel())
    }
}
