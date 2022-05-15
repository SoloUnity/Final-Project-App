//
//  HomeViewRow.swift
//  Programming Techniques and Applications
//
//  Created by Gordon Ng on 2022-05-14.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit) // takes as much space as it can without overflowing from the screen while maintaining the aspect ration
                
            HStack{
                
                // Image
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                // Text
                
                VStack(alignment: .leading){
                    //Headline
                    Text(title)
                        .bold()
                    
                    //Description
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                    
                    //Icons
                    HStack{
                        // Number of lessons and questions
                        Image(systemName: "books.vertical")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                        Text(count)
                            .font(.caption)
                        
                        
                        // Time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                        Text(time)
                            .font(.caption)
                    }
                }
            
            }
            .padding(.horizontal, 20)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "python", title: "Learn Python", description: "A second level programming course covering parts of a university level data structures course", count: "x lessons", time: "2 Hours")
            
    }
}
