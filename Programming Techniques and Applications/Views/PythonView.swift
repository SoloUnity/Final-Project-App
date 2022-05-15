//
//  PythonView.swift
//  Programming Techniques and Applications
//
//  Created by Gordon Ng on 2022-05-15.
//

import SwiftUI

struct PythonView: View {
    
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        ScrollView{
            LazyVStack{
                // Confirm that currentModule is set
                if model.currentModule != nil{
                    ForEach(0..<model.currentModule!.content.lessons.count){ index in
                        
                        NavigationLink(
                            destination:
                                ContentDetailView(index: index)
                                    .onAppear(perform: {
                                        model.beginLesson(index)
                                    }),
                            label: {
                            ContentViewRow(index: index)
                        })
                        
                        
                        
                        
                    }
                }
               
            }
            .padding()
            .accentColor(.black)
            .navigationTitle("Learn \(model.currentModule?.category ?? "")") // empty string if no module is set
        }
    }
}


