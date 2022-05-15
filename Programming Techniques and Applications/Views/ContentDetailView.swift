// Gordon Ng , 2031408
// R. Vincent , instructor
// Advanced Programming , section 1
// Final Project

import SwiftUI
import YouTubePlayerKit // External framework to access youtube API

// Subview called from ContentView
struct ContentDetailView: View {
    
    // Defines model as type ContentModel and sets it as an environment object so that it can be accessed by different views on the fly
    @EnvironmentObject var model: ContentModel
    
    // Sets index as type integer
    var index: Int
    
    var body: some View {
        
        let lesson = model.currentLesson    // Calls the currenLesson method from ContentModel
        let url = YouTubePlayer(source: .url(lesson?.video ?? ""))  // Passes a url from parsed JSON file, as an unwrapped optional that defaults to a blank string, into a youtube player object
        let pages = Int(lesson?.pages ?? "")    // Sets the page number from an unwrapped optional for the number of pages parsed from JSON
        let id = (lesson?.id ?? 0)  // Sets the id number from an unwrapped optional for the id parsed from JSON
        
        // View container allowing for scrolling
        ScrollView{
            
            // Obtains info from location in a ScrollView
            ScrollViewReader { (proxy: ScrollViewProxy) in // ScrollViewProxy scans the various id of views
                
                // View container allowing for vertically stacked UI
                VStack(alignment: .leading){
                    
                    // Youtube Player API to play relevant lesson videos
                    YouTubePlayerView(url)
                        .cornerRadius(10)
                        .aspectRatio(CGSize(width: 1920, height: 1080), contentMode: .fit)
                        
                    
                    // Loops through lesson slides and displays them
                    ForEach(0...((pages ?? 1) - 1), id: \.self) { page in
                        
                        // Displays each slide as an image
                        Image("l" + String(id + 1) + "-" + String(page + 1))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    // Displays if there is another lesson, calls hasNextLesson method from ContentModel
                    if model.hasNextLesson(){
                        
                        // Button UI type
                        Button(action: {
                            
                            proxy.scrollTo("top", anchor: .top) // Scrolls to top of view
                            model.nextLesson()  // Calls nextLesson method from ContentModel
                            
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
                                
                                // Displays title of the next lesson
                                Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                    .foregroundColor(Color.white)
                                    .bold()
                            }
                        })
                    }
                }
                .padding(.horizontal)   // Padding for the UI left and right
                .navigationTitle(model.currentModule!.content.lessons[model.currentLessonIndex].title) // Title of the lesson
                .id("top") // Id to identify the top for scrolling
                .tag("top") // Tag to identify the top for scrolling
            }
        }
    }
}

