// Gordon Ng , 2031408
// R. Vincent , instructor
// Advanced Programming , section 1
// Final Project

// Each module
struct Module: Decodable, Identifiable{
    
    var id: Int
    var category: String
    var content: Content
    
}

// General information of each Module
struct Content: Decodable, Identifiable{
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var lessons: [Lesson]
    
}

// Specific lessons form Content
struct Lesson: Decodable, Identifiable{
    
    var id: Int
    var title: String
    var video: String
    var pages: String
    
}


