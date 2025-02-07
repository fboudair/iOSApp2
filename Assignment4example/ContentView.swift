import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ScavengerHuntViewModel()
    @State private var hasStarted = false
    @State private var showVictoryMessage = false
    @State private var currentClueIndex = 0  
    @State private var hasSubmittedPhoto = false
    var body: some View {
        NavigationView {
            ZStack {
                Image ("Image 4")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("🏆Scavenger Hunt🏆")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    if hasStarted {
                        Text("Clues Found: \(viewModel.foundCount) / \(viewModel.clues.count)")
                            .foregroundColor(.red)
                            .padding(.bottom)
                        
                        Text(viewModel.getDiscount())
                            .foregroundColor(.blue)
                            .padding(.bottom)
                        
                        if currentClueIndex < viewModel.clues.count {
                            ClueCardView(
                                clue: viewModel.clues[currentClueIndex],
                                viewModel: viewModel,
                                hasSubmittedPhoto: $hasSubmittedPhoto
                            )
                            .padding(.bottom)
                            .onAppear {
                                
                                hasSubmittedPhoto = false
                            }
                        }
                        
                        
                        Button("Next Clue") {
                            currentClueIndex += 1
                            hasSubmittedPhoto = false
                        }
                        .buttonStyle(.bordered)
                        .background(.white)
                        .foregroundColor(.black)
                        .padding(.bottom)
                        .disabled(!hasSubmittedPhoto)
                        
                        // Reset Button
                        Button("Reset Hunt") {
                            resetGame()
                        }
                        .buttonStyle(.bordered)
                        .background(.white)
                        .foregroundColor(.black)
                        .padding()
                    } else {
                        // Start Button
                        Button("Start the Hunt 🎯") {
                            hasStarted = true
                            viewModel.loadClues()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color("gold"))
                        .foregroundColor(.black)
                        .font(.title)
                        .padding(.top, 350)
                    }
                }
                .padding()
                .alert("Congratulations! You've won the Ultimate Grand Prize! 🎁", isPresented: $showVictoryMessage) {
                    Button("OK", role: .cancel) { }
                }
                .onChange(of: viewModel.checkUltimatePrize()) { hasWon in
                    if hasWon {
                        showVictoryMessage = true
                    }
                }
                .onAppear {
                    // Ensure clues are loaded on appear
                    if viewModel.clues.isEmpty {
                        viewModel.loadClues()
                    }
                }
            }
        }
        
    }

    private func resetGame() {
        hasStarted = false
        viewModel.resetClues()
        currentClueIndex = 0
        hasSubmittedPhoto = false
    }
}

#Preview {
    ContentView()
}
