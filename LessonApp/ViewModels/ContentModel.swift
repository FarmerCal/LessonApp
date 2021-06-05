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
    
    var styleData: Data?
    
    init(){
        
        self.modules = DataServices.parseLessonsJson()
        self.styleData = DataServices.parseStyleHtml()
    }
    
    func beginModule(_ moduleid:Int){
        
        for index in 0..<modules.count{
            
            if modules[index].id == moduleid{
                
                currentModuleIndex = index
                break
            }
        }
        
        currentModule = modules[currentModuleIndex]
    }
}
