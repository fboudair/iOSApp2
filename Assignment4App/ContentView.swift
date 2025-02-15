//

//  ContentView.swift

//  Assignment4App

//

//  Created by Louise Rennick on 2025-02-06.

//



import SwiftUI



//change the background with a color or image



struct ScavengerHuntView : View {

    

    // change the clues to meet your city or town of local businesses

    //add your own clues and fun things

    let clues = [

        "Find the oldest bookstore in town.",

        "Look for a golden popcorn statue at the cinema.",

        "Locate the giant coffee cup downtown.",

        "A mural of history—find the past painted on the wall.",

        "The place where music never stops playing.",

        "The bakery known for its legendary croissants.",

        "Find the hidden garden behind the library.",

        "A bridge with lovers’ locks—find the heart engraved one.",

        "The tallest clock tower in the city.",

        "A neon-lit diner straight from the ‘50s."

    ]

    

    @State private var foundItems: Set<Int> = []

    @State private var selectedImage: UIImage? = nil

    

    var discountMessage: String {

        switch foundItems.count {

        case 7...9:

            return "20% Discount Code: LOCAL20"

        case 5...6:

            return "10% Discount Code: LOCAL10"

        case 10:

            return "20% Discount Code: LOCAL20\nYou're entered into the $5000 draw!"

        default:

            return "No discount yet."

        }

    }

    

    var body: some View {
        NavigationStack {
        ZStack {

            Color("Color 2")

                .edgesIgnoringSafeArea(.all)

            VStack {

                //change the text to your town or city and maybe create your own font

                Text("Gotham City Scavenger Hunt")

                    .font(.custom("Batwan-Regular", size: 40))

                    .bold()

                    .padding()

                // change your own font and text

                Text("You can win when you find more clues!")

                    .font(.subheadline)

                    .padding(.bottom)

                

                ScrollView {

                    VStack(spacing: 16) {

                        ForEach(clues.indices, id: \.self) { index in

                            VStack {

                                //change the background

                                //change the buttons

                                //change text font

                                

                                Text(clues[index])

                                    .font(.headline)

                                    .padding()

                                

                                Button(action: {

                                    foundItems.insert(index)

                                }) {

                                    Text(foundItems.contains(index) ? "✅ Found!" : "Take Photo")

                                        .foregroundColor(Color(.black))

                                        .padding()

                                        .frame(maxWidth: .infinity)

                                        .background(foundItems.contains(index) ? Color.green : (Color("Light Brown")))

                                        .cornerRadius(8)
                                }

                            }

                            .padding()

                            .background(Color.gray.opacity(0.2))

                            .cornerRadius(10)

                        }

                    }

                }

                .padding()

        
                    NavigationLink(destination: ThankYouView()) {

                                          Text("Submit Results")

                                              .foregroundColor(.white)

                                              .padding()

                                              .frame(maxWidth: .infinity)

                                              .background(Color.orange)

                                              .cornerRadius(8)

                                      }

                                      .padding()

                                      

                                      Text(discountMessage)

                                          .font(.headline)

                                          .foregroundColor(.red)

                                          .padding()

            }

                                  .padding()

                              }

                          }

                      }
}
                  



                  struct ScavengerHuntView_Previews: PreviewProvider {

                      static var previews: some View {

                          ScavengerHuntView()

                      }

                  }



