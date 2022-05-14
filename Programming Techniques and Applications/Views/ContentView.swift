//
//  ContentView.swift
//  Programming Techniques and Applications
//
//  Created by Gordon Ng on 2022-05-14.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        ScrollView{
            LazyVStack{
                // Confirm that currentModule is set
                if model.currentModule != nil{
                    ForEach(0..<model.currentModule!.content.lessons.count){ index in
                        
                        ContentViewRow(index: index)
                        
                        
                        
                    }
                }
               
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")") // empty string if no module is set
        }
    }
}


