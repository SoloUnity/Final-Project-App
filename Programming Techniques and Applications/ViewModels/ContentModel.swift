// Gordon Ng , 2031408
// R. Vincent , instructor
// Advanced Programming , section 1
// Final Project

import Foundation

// Class of typle ObervableObject: allowing global access in other files
class ContentModel: ObservableObject {
    
    // Published property allows the notification views when variables are changed
    @Published var modules = [Module]() // Array of modules, published
    @Published var currentModule: Module?   // Current module unwrapped optional
    @Published var currentLesson: Lesson?   // Current lesson unwrapped optional
    var currentModuleIndex = 0
    var currentLessonIndex = 0
    
    // Initialiser gets called when class ContentModel has new instance
    init(){
        getLocalData()
    }
    
    // Data methods
    func getLocalData() {
        
        // Gets URL to the JSON file
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        
        // Do and Catch is like try and except from python
        do{
            let jsonData = try Data(contentsOf: jsonURL!) // Read file into a data object
            
            // Decodes the Json file using a JSONDecoder instance
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self ,from: jsonData)
    
            // Assign parsed modules to the modules property
            self.modules = modules
        }
        catch{
            print("Error: Could not parse through the local data, please check the format")
        }
    }
    
    func beginModule(_ moduleid: Int){
        /// beginModule finds the appropriate module to display
        /// moduleid of type int serves to compare with id property of modules
        
        // Loops through the module array to find the appropriate module
        for index in 0..<modules.count {
            
            // Checks to see if that module is equivalent to passed in moduleid
            if modules[index].id == moduleid {
                
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex:Int){
        /// beginLesson finds the appropriate lesson to display
        /// lessonIndex of type int serves to compare with the total number of lessons

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
        /// hasNextLesson serves to see if theres another lesson using index
        
        if currentLessonIndex + 1 < currentModule!.content.lessons.count{
            return true
        }
        else {
            return false
        }
            
    }
    
    func nextLesson(){
        /// hasNextLesson serves to see if theres another lesson using index
        // Advance to the next lesson
        currentLessonIndex += 1
        
        //Check that it is within range
        if currentLessonIndex < currentModule!.content.lessons.count{
            
            // Set the current lesson property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            
        }
        else{
            
            // Reset the lesson state
            currentLesson = nil
            currentLessonIndex = 0
            
        }
    }
}
