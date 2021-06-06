//
//  ContentDetialView.swift
//  LessonApp
//
//  Created by Callum Day Ham on 6/5/21.
//

import SwiftUI
import AVKit

struct ContentDetialView: View{
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View{
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack{
            
            if url != nil{
                
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            if model.hasNextLesson(){
                
                Button(action: {
                    
                    model.nextLesson()
                }, label: {
                    
                    ZStack{
                    
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                    Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                        .foregroundColor(.white)
                        .bold()
                    }
                    })
            }
        }
        .padding([.leading, .trailing], 10)
    }
}

struct ContentDetialView_Previews: PreviewProvider{
    
    static var previews: some View{
        
        ContentDetialView()
    }
}
