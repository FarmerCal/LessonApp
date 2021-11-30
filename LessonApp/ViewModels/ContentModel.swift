//
//  ContentModel.swift
//  LessonApp
//
//  Created by Callum Day Ham on 6/3/21.
//

import Foundation

class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
    
    // store data for current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    var styleData: Data?
    
    // current selected content and test
    @Published var currentContentSelected:Int?
    
    init(){
        
        self.modules = DataServices.parseLessonsJson()
        self.styleData = DataServices.parseStyleHtml()
    }
    
    func beginModule(_ moduleid: Int){
        
        for index in 0..<modules.count{
            
            if modules[index].id == moduleid{
                
                currentModuleIndex = index
                break
            }
        }
        
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex: Int){
        
        if lessonIndex < currentModule!.content.lessons.count{
            
            currentLessonIndex = lessonIndex
        }
        else{
            
            currentLessonIndex = 0
        }
        
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
    func nextLesson(){
        
        currentLessonIndex += 1
        
        if currentLessonIndex < currentModule!.content.lessons.count{
            
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        }
        else{
            
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
    func hasNextLesson() -> Bool{
        
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
}
