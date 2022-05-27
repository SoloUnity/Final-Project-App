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
        getRemoteData() // Downloads remote JSON file and parses through it
    }
    
    
    func getRemoteData() {
        /// Downloads remote JSON file and parses through it
        
        let urlString = "https://raw.githubusercontent.com/SoloUnity/Programming-Techniques-and-Applications-App/main/data.json"
        let url = URL(string: urlString) // Create a URL object
        
        guard url != nil else {
            // In case of a faulty or empty URL, returns and stops code
            return
        }
        
        let request = URLRequest(url: url!) // Pass unwrapped URL object into a URLRequest object
        let session = URLSession.shared // Gets the session and begins the task
        let dataTask = session.dataTask(with: request) { (data, response, error) in // Fetches the file from url
            
            guard error == nil else { // Checks for an empty or nil url
                return
            }
            
            do {
                let decoder = JSONDecoder() // Create an instance of JSONDecoder
                let modules = try decoder.decode([Module].self, from: data!) // Decode
                
                DispatchQueue.main.async{ // Asigns code to the main thread instead of the background thread
                    self.modules += modules // Add parsed modules into the modules property
                }
                
            }
            catch {
                print("Error: Could not parse through the remote data, please check the format") // Error message
            }
        }
        
        dataTask.resume() // Starts the data task
        
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
        /// Returns a boolean
        
        if currentLessonIndex + 1 < currentModule!.content.lessons.count{
            return true
        }
        else {
            return false
        }
            
    }
    
    func nextLesson(){
        /// nextLesson serves to set the next lesson

        
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
