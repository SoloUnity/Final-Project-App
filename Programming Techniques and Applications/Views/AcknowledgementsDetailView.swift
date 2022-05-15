// Gordon Ng , 2031408
// R. Vincent , instructor
// Advanced Programming , section 1
// Final Project

import SwiftUI
import YouTubePlayerKit

// Subview called from AcknowledgementsView
struct AcknowledgementsDetailView: View {
    
    // Defines model as type ContentModel and sets it as an environment object so that it can be accessed by different views on the fly
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {

        // View container allowing for vertically stacked UI
        VStack{
            
            // Displays image of Jione and Gordon
            Image("2bois")
                .resizable()
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
            
            // Button that links to Gordon's Instagram
            Button(action: {
                
                // Link to instagram, passes in url into URL object which is then opened
                if let url = URL(string: "https://www.instagram.com/g0703/") {
                       UIApplication.shared.open(url)
                    }
                }
           , label: {
                
                // View container allowing for stacked UI on the Z axis
                ZStack{
                    
                    // Rectangle view UI
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(Color.cyan)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    // View container allowing for horizontally stacked UI
                    HStack{
                        
                        // Image of instagram logo
                        Image("ig")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        // Text of username
                        Text("@g0703")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
            })
            
            // Button that links to Jione's Instagram
            Button(action: {
                
                // Link to instagram, passes in url into URL object which is then opened
                if let url = URL(string: "https://www.instagram.com/jioneban_/") {
                       UIApplication.shared.open(url)
                }
            }
           , label: {
                
                // View container allowing for stacked UI on the Z axis
                ZStack{
                    
                    // Rectangle view UI
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(Color.cyan)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    // View container allowing for horizontally stacked UI
                    HStack{
                        
                        // Image of instagram logo
                        Image("ig")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        // Text of username
                        Text("@jioneban_")
                            .foregroundColor(Color.white)
                            .bold()
                        
                            }
                        }
                    })
                }
                .padding(.horizontal) // Padding on left and right side
                .navigationTitle("Social Media Links") // Title of the page
        }
}

