//
//  ContentModel.swift
//  Programming Techniques and Applications
//
//  Created by Gordon Ng on 2022-05-13.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    // Current lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    var styleData: Data?
    
    // Initialiser gets called when class ContentModel has new instance
    init(){
        getLocalData()
    }
    
    // Data methods
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
    
    // Module Navigation methods
    func beginModule(_ moduleid: Int){
        
        // Find the index for module ID
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                
                // Found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex:Int){
        // Check that the lesson index is within range of module lessons
        if lessonIndex < currentModule!.content.lessons.count{
            currentLessonIndex = lessonIndex
        }
        else{
            currentLessonIndex = 0
        }
        
        // Setting the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
    func hasNextLesson() -> Bool{
        if currentLessonIndex + 1 < currentModule!.content.lessons.count{
            return true
        }
        else {
            return false
        }
            
    }
    
    func nextLesson(){
        // Advance the lesson
        currentLessonIndex += 1
        
        //Check that it is within range
        if currentLessonIndex < currentModule!.content.lessons.count{
            // Set the current lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        }
        else{
            // Reset the lesson state
            currentLessonIndex = 0
            currentLesson = nil
            
        }
        
        
    }
}
