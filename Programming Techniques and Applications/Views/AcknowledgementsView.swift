//
//  HomeViewRow.swift
//  Programming Techniques and Applications
//
//  Created by Gordon Ng on 2022-05-14.
//

import SwiftUI

struct AcknowledgementsView: View {
    
    var image: String
    var title: String
    var description: String
    
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
                
                VStack(alignment: .leading, spacing: 10){
                    //Headline
                    Text(title)
                        .bold()
                    
                    //Description
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                    
              
                }
            
            }
            .padding(.horizontal, 20)
        }
    }
}

