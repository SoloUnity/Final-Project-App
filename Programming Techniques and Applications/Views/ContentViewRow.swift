// Gordon Ng , 2031408
// R. Vincent , instructor
// Advanced Programming , section 1
// Final Project

import SwiftUI

// Subview called from ContentView
struct ContentViewRow: View {
    
    // Defines model as type ContentModel and sets it as an environment object so that it can be accessed by different views on the fly
    @EnvironmentObject var model: ContentModel
    
    // Sets the passed in index as type integer
    var index: Int
    
    var body: some View {
        
        // Sets variable lesson as the current lesson
        let lesson = model.currentModule!.content.lessons[index]
        
        // View container allowing for stacked UI on the Z axis
        ZStack(alignment: .leading){
            
            // Rectangle view UI
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            // View container allowing for horizontally stacked UI, horizontal spacing of ui elements of 30 pixels
            HStack (spacing: 30){
                
                // Lesson number
                Text(String(index + 1))
                    .bold()
                
                // View container allowing for vertically stacked UI
                VStack(alignment: .leading){
                    
                    // Displays lesson title
                    Text(lesson.title)
                        .bold()
                        .font(.system(size: 14))
                        
                    // Displays number of pages 
                    Text("\(lesson.pages) pages")
                }
            }
            .padding()
        }
        .padding(.bottom, 5)
    }
}

