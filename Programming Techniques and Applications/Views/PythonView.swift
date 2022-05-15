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
            VStack{
                // Confirm that currentModule is set
                Image("2windows")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(CGSize(width: 1920, height: 1080), contentMode: .fit)
                
                
                
                Text("Placeholder Text")
                Spacer()
                
                Button(action: {
                    if let url = URL(string: "https://replit.com/@GordonNg/Helper-Programs#pdftojson.py") {
                           UIApplication.shared.open(url)
                        }
                }
                       , label: {
                    ZStack{
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(Color.cyan)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                        
                        Text("Click to Get Helper Programs")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                    
                })
                
                
            }
            .padding()
            .navigationTitle("Helper Programs") // empty string if no module is set

    }
}


