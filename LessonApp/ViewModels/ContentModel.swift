//
//  ContentModel.swift
//  LessonApp
//
//  Created by Callum Day Ham on 6/3/21.
//

import Foundation

class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init(){
        
        self.modules = DataServices.parseLessonsJson()
        self.styleData = DataServices.parseStyleHtml()
//
//         getLocalData()
    }
    
    func getLocalData(){
     
        let jsonUrl = Bundle.main.url(forResource: "lessons", withExtension: "json")
        
        do{
            
        let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            self.modules = modules
        }
        catch{
            print("error 1")
        }
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
            
        }
        catch{
            print("error 2")
        }
    }
}
