//
//  DataServices.swift
//  LessonApp
//
//  Created by Callum Day Ham on 6/3/21.
//

import Foundation

class DataServices{
    
    static func parseLessonsJson() -> [Module]{
        
        let jsonUrl = Bundle.main.url(forResource: "lessons", withExtension: "json")
        
        do{
            
        let jsonData = try Data(contentsOf: jsonUrl!)
            
            let jsonDecoder = JSONDecoder()
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            return modules
        }
        catch{
            print("error 1")
        }
        
        return [Module]()
    }
    
    static func parseStyleHtml() -> Data{
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            
            let styleData = try Data(contentsOf: styleUrl!)
            
            return styleData
        }
        catch{
            print("error 2")
        }
        
        return Data()
    }
}
