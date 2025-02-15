//
//  ThankView.swift
//  Assignment4App
//
//  Created by Fatima Bdair on 2025-02-15.
//

import SwiftUI



struct ThankYouView: View {

    var body: some View {

        ZStack {

            Color("Color")

                .ignoresSafeArea()



            VStack {

                Spacer()

        

                Text("Thank You for Playing!")

                    .font(.largeTitle)

                    .bold()

                    .padding()



                Text("You've completed the scavenger hunt.")

                    .font(.title2)

                    .padding()

                

                Spacer()

            }

            .foregroundColor(.black)

            .edgesIgnoringSafeArea(.all)

            .cornerRadius(10)

            .padding()

            .navigationBarBackButtonHidden(true)

        }

    }

}



struct ThankYouView_Previews: PreviewProvider {

    static var previews: some View {

        ThankYouView()

    }

}
