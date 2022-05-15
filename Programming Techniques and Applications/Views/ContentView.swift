// Gordon Ng , 2031408
// R. Vincent , instructor
// Advanced Programming , section 1
// Final Project

import SwiftUI

// Subview called from Homeview
struct ContentView: View {
    
    // Defines model as type ContentModel and sets it as an environment object so that it can be accessed by different views on the fly
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // View container allowing for scrolling
        ScrollView{
            
            // View container allowing for vertically stacked UI, differs as it unloads when not on screen for performance
            LazyVStack{
                
                // Confirm that currentModule is set
                if model.currentModule != nil{
                    
                    // For loop in the range up to the number of lessons read from parsed JSON, allows to display multiple lessons that use the same view
                    ForEach(0..<model.currentModule!.content.lessons.count){ index in
                        
                        // Linking the card to ContentDetailView view structure, clicking the card will bring up the view
                        NavigationLink(destination: ContentDetailView(index: index).onAppear(perform: {
                                
                                // Runs beginLesson method to determine and set the current lesson, passes in the index number attributed to that lesson
                                model.beginLesson(index)
                            }),
                            label: {
                                
                                // Displays an instance of ContantViewRow on every loop, passes in the counted up index of a lesson
                                ContentViewRow(index: index)
                        })
                    }
                }
            }
            .padding()  // Adds padding to UI
            .accentColor(.black)    // Sets text to black
            .navigationTitle("Learn \(model.currentModule?.category ?? "")") // Sets the title, optional that sets title as empty string if there is no module
        }
    }
}


