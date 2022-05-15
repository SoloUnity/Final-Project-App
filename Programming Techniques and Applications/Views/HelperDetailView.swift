// Gordon Ng , 2031408
// R. Vincent , instructor
// Advanced Programming , section 1
// Final Project

import SwiftUI

// Subview called from HelperView
struct HelperDetailView: View {
    
    // Defines model as type ContentModel and sets it as an environment object so that it can be accessed by different views on the fly
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // View container allowing for vertically stacked UI
            VStack{
                
                // Image of helper programs
                Image("2windows")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(CGSize(width: 1920, height: 1080), contentMode: .fit)
                
                // Description of helper programs
                Text("There are two helper programs, one to convert PDF slides into an appropriate JSON information file, as well as a conversion to images for display within the lesson card of this app.")
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                //
                Button(action: {
                    // Link to helper programs, passes in url into URL object which is then opened
                    if let url = URL(string: "https://replit.com/@GordonNg/Helper-Programs#pdftojson.py") {
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
                        
                        // Displayed text
                        Text("Click to Get Helper Programs")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                })

            }
            .padding() // Padding on left and right side
            .navigationTitle("Helper Programs") // Title of page
    }
}


