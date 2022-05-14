//
//  ContentDetailView.swift
//  Programming Techniques and Applications
//
//  Created by Gordon Ng on 2022-05-14.
//

import SwiftUI
import YouTubePlayerKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        
        let url = YouTubePlayer(source: .url("https://www.youtube.com/watch?v=ktdqlQ1zhg4")) // Replace by String(lesson?.video?? "")
        // Youtube Player API
        
        VStack{
            YouTubePlayerView(url)
                .cornerRadius(10)
                
            // Description
            
            // Next lesson button
            if model.hasNextLesson(){
                Button(action: {
                    //Advance the lesson
                    model.nextLesson()
                }
                , label: {
                    ZStack{
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(Color.cyan)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                    
                })
            }
        }
            .padding()
        
        
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
