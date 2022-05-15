// Gordon Ng , 2031408
// R. Vincent , instructor
// Advanced Programming , section 1
// Final Project

import SwiftUI

// Subview called from Homeview
struct HelperView: View {
    
    // Sets type of passed in parameters
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        
        // View container allowing for stacked UI on the Z axis
        ZStack{
            
            // Rectangle view UI
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit) // takes as much space as it can without overflowing from the screen while maintaining the aspect ration
            
            // View container allowing for horizontally stacked UI
            HStack{
                
                // Logo mage
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                

                // View container allowing for vertically stacked UI
                VStack(alignment: .leading, spacing: 10){
                    //Headline
                    Text(title)
                        .bold()
                    
                    //Description
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                    
                    // View container allowing for horizontally stacked UI
                    HStack{
                        
                        // Icon for helper programs
                        Image(systemName: "wrench.and.screwdriver")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                        // Displays the number of helper programs
                        Text("2 Helper Programs")
                            .font(.caption)
                    }
                }
            }
            .multilineTextAlignment(.leading)   // Forces text to the left
            .padding(.horizontal, 20)   // 20 pixel padding on left and right side
        }
    }
}

