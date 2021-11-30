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
                    
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                    Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                        .foregroundColor(.white)
                        .bold()
                    }
                    })
            }
            else {
                // show the complete button instead
                
                Button(action: {
                    
                    model.currentContentSelected = nil
                }, label: {
                    
                    ZStack{
                    
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                    Text("Complete!")
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
