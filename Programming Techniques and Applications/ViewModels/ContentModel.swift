//
//  ContentModel.swift
//  Programming Techniques and Applications
//
//  Created by Gordon Ng on 2022-05-13.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    // Initialiser gets called when class ContentModel has new instance
    init(){
        getLocalData()
    }
    
    func getLocalData() {
        
        // Get URL to the JSON file
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        // Read file into a data object
        // Error like try/except from python
        do{
            let jsonData = try Data(contentsOf: jsonURL!)
            
            // decoding the Json file
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self ,from: jsonData)
    
            // Assign parsed modules to the modules property
            self.modules = modules
        }
        catch{
            print("Error: Could not parse through the local data, please check the format")
        }
        
        // Parsing the style.html file
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            // Read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            // Assin to property optional
            self.styleData = styleData
        }
        catch{
            // Errors
            print("Could not parse the style.html data")
        }
    }
}
