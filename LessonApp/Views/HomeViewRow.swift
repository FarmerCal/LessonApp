//
//  HomeViewRow.swift
//  LessonApp
//
//  Created by Callum Day Ham on 6/4/21.
//

import SwiftUI

struct HomeViewRow: View{
   
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View{

        ZStack{
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack{
                
                Spacer()
                
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack(alignment: .leading, spacing: nil, content:{
                    
                    Text(title)
                        .bold()
                    Text(description)
                        .font(Font.system(size: 13))
                    
                    HStack{
                        
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: .center)
                        Text(count)
                            .font(Font.system(size: 10))
                        
                        Spacer()
                        
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: .center)
                        Text(time)
                            .font(Font.system(size: 10))
                        
                        Spacer()
                    }
                    .foregroundColor(.gray)
                })
                
                Spacer()
            }
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider{
    
    static var previews: some View{
        HomeViewRow(image: "swift", title: "Learn Swift", description: "an epic description", count: "20 Lessons", time: "2 Hours")
    }
}
