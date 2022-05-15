// Gordon Ng , 2031408
// R. Vincent , instructor
// Advanced Programming , section 1
// Final Project

import SwiftUI

// A subview that HomeView calls
struct HomeViewRow: View {
    
    // Defines passed in variables parsed from JSON as their appropriate type
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        
        // View container allowing for stacked UI on the Z axis
        ZStack{
            
            // Rectangle view UI
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                
            // View container allowing for horizontally stacked UI
            HStack{
                
                // Image logo on the card
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                

                // View container allowing for vertically stacked UI, alignment is leading on the left, with a vertical spacing of 10 for text
                VStack(alignment: .leading, spacing: 10){
                    
                    // Title of the card
                    Text(title)
                        .bold()
                    
                    // Description
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                    
                    // View container allowing for horizontally stacked UI
                    HStack{
                        
                        // Icon for lessons
                        Image(systemName: "books.vertical")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                        // Displays number of lessons
                        Text(count)
                            .font(.caption)
                        
                        // Icon for length of lessons
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                        // Displays length of lessons
                        Text(time)
                            .font(.caption)
                    }
                }
            }
            .multilineTextAlignment(.leading)   // Forces text to the left
            .padding(.horizontal, 20)   // 20 pixel padding on left and right side
        }
    }
}

