//
//  ContentView.swift
//  Programming Techniques and Applications
//
//  Created by Gordon Ng on 2022-05-13.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView{
            VStack (alignment: .leading){
                Text("Progamming Techniques and Applications")
                    .padding(.leading, 20)
                
                ScrollView{
                    LazyVStack{
                        ForEach(model.modules){ module in
                            
                            VStack (spacing: 20){
                                
                                
                                NavigationLink(destination: ContentView().onAppear(perform: {
                                    model.beginModule(module.id)
                                    
                                }), label: {
                                    // Lesson Card
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                })
                                
                                NavigationLink(destination: PythonView().onAppear(perform: {
                                    model.beginModule(module.id)
                                    
                                }), label: {
                                    // Lesson Card
                                    HomeViewRow(image: "helper", title: "Helper Programs", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                })
                                
                                // Acknowledgements Card
                                AcknowledgementsView(image: "mari", title: "Acknowledgements", description: "Thank you to Robert Vincent for providing the course material, Jione Ban for the companion python programs and Gordon for this app")
                                

                                
                            }
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationTitle("Final Project")
            
            
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
