// Gordon Ng , 2031408
// R. Vincent , instructor
// Advanced Programming , section 1
// Final Project



import SwiftUI

// The first view accessed by the opening of the app
struct HomeView: View {
    
    // Defines model as type ContentModel and sets it as an environment object so that it can be accessed by different views on the fly
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // View container allowing for linking of different view structures
        NavigationView{
            
            // View container allowing for vertically stacked UI
            VStack (alignment: .leading){
                
                // Subtitle
                Text("Progamming Techniques and Applications")
                    .padding(.leading, 17)
                
                // View container allowing for scrolling
                ScrollView{
                    
                    // View container allowing for vertically stacked UI, differs as it unloads when not on screen for performance
                    LazyVStack{
                        
                        // Loops through Module parsed from JSON file in ContentModel
                        ForEach(model.modules){ module in
                            
                            // View container allowing for vertically stacked UI, 20 spacing between each subsequent new card
                            VStack (spacing: 20){
                                
                                // Linking the card to ContentView view structure, clicking the card will bring up the view
                                NavigationLink(destination: ContentView().onAppear(perform: {
                                    // Runs beingModule method to set the current module property for it to be used in the ContentView instance
                                    model.beginModule(module.id)
                                    
                                }),
                               label: {
                                    // Calls HelperView structure to display on the home page with passed through parsed JSON variables
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                })
                            }
                            
                            
                            // Linking the card to HelperDetailView view structure, clicking the card will bring up the view
                            NavigationLink(destination: HelperDetailView().onAppear(perform: {
                            }),
                           label: {
                                // Calls HelperView structure to display on the home page with hard coded variables
                                HelperView(image: "helper", title: "Helper Programs", description: "To add new lessons or cards, use these helper programs written in Python!")
                            })
                            
                            
                            // Linking the card to AcknowledgementsDetailView view structure, clicking the card will bring up the view
                            NavigationLink(destination: AcknowledgementsDetailView().onAppear(perform: {
                            }),
                           label: {
                                // Calls AcknowledgementsView structure to display on the home page with hard coded variables
                                AcknowledgementsView(image: "mari", title: "Acknowledgements", description: "Thank you to Robert Vincent for providing the course material, Jione Ban for the companion python programs and Gordon for this app.")
                            })
                        }
                    }
                    .accentColor(.black)    // Sets colour of text
                    .padding()  // Adds padding on UI elements
                }
            }
            .navigationTitle("Final Project") // Sets title
        }
        .navigationViewStyle(.stack)  // Style of navigationView container 
    }
}

// Structure of type PreviewProvider that calls the HomeView struct above
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())  // Passes in instance of ContentModel to interface with parsed JSON information, and allow linking of active module
    }
}
