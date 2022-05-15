//
//  ContentDetailView.swift
//  Programming Techniques and Applications
//
//  Created by Gordon Ng on 2022-05-14.
//

import SwiftUI
import YouTubePlayerKit
import PDFKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var index: Int
    
    var body: some View {
        
        let lesson = model.currentLesson
        
        let url = YouTubePlayer(source: .url(lesson?.video ?? ""))
        
        let pages = Int(lesson?.pages ?? "")
        
        let id = (lesson?.id ?? 0)
        
        
        
        
        
        ScrollView{
            
            ScrollViewReader { (proxy: ScrollViewProxy) in
                
                VStack(alignment: .leading){
                    
                    // Youtube Player API
                    YouTubePlayerView(url)
                        .cornerRadius(10)
                        .aspectRatio(CGSize(width: 1920, height: 1080), contentMode: .fit)
                        
                    
                    // PDF in Images
                    ForEach(0...((pages ?? 1) - 1), id: \.self) { page in
                        Image("l" + String(id + 1) + "-" + String(page + 1))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    // Next lesson button
                    if model.hasNextLesson(){
                        Button(action: {
                            //Advance the lesson
                            proxy.scrollTo("top", anchor: .top)
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
                .padding(.horizontal)
                .navigationTitle(model.currentModule!.content.lessons[model.currentLessonIndex].title)
                .id("top") 
                .tag("top")
                
                
            }
            
            
        }
        
        
        
    }
}

