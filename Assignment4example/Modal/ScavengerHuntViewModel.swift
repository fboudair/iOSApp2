import SwiftUI

// MARK: - ViewModel for App Logic
class ScavengerHuntViewModel: ObservableObject {
    @Published var clues: [Clue] = []
    @Published var foundCount: Int = 0
    
    init() {
        loadClues()
    }
    
    func loadClues() {
        let json = """
        [
            {"text": "Find Nature's beauty, calm and free,\\n take a picture beside a tree", "location": "Nature's beauty at Woodbine park"},
            {"text": "Where books are stacked and knowledge is free,\\n take a pic where you love to read", "location": "Birchmount Library"},
            {"text": "From burgers to fries or a meal that's neat,\\n take a picture before you eat", "location": "North york Restaurant"},
            {"text": "Scn me fast, hear me beep,\\n take a selfie before you leave", "location": "Self-checkout or cashier counter at Toronto"},
            {"text": "Where the bread is warm and smells so sweet,\\n take a picture at the bakers", "location": "Kennedy Bakery"},
            {"text": "Sweet or sour, in bottles or cans,\\n take a pictures of the juice stands", "location": "Juice aisle North york store"},
            {"text": "From shampoos to soap and lotions too,\\n take a pivture where is the products", "location": "Beauty aisle, TorontoBeauty"},
            {"text": "People rush and trains arrive,\\n find and take a picture for this place where commuters thrive!", "location": "Train station Dundas Station"},
            {"text": "People run, people play,\\n take a picture where kids stay", "location": "Playground at Leslie park"},
            {"text": "Zoom, zoom, cars drive by,\\n take a picture of the road", "location": "Bridge Niagara Falls"},
        ]
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()

        do {
            let decodedClues = try decoder.decode([Clue].self, from: json)
            clues = decodedClues
            print("Decoded clues: \(clues)")
        } catch {
            print("Failed to decode clues with error: \(error)")
        }
    }



    
    func markClueFound(_ clue: Clue, with image: Data) {
        if let index = clues.firstIndex(where: { $0.id == clue.id }) {
            clues[index].found = true
            clues[index].image = image
            foundCount += 1
        }
    }
    
    func checkUltimatePrize() -> Bool {
        return clues.allSatisfy { $0.found }
    }

    func getDiscount() -> String {
        guard foundCount > 0 else {
            return "Start finding clues to win rewards!"
        }
        if checkUltimatePrize() {
            return "Congratulations! You've won the Ultimate Grand Prize! 🎁"
        }
        switch foundCount {
        case 5...6: return "10% Discount Unlocked!"
        case 7...9: return "20% Discount Unlocked!"
        case 10: return "Grand Prize Entry $5000.00!"
        default: return "Find more items to win rewards!"
        }
    }
    
    // Get the current clue that hasn't been found yet (first unfound clue)
    func getCurrentClue() -> Clue? {
        return clues.first(where: { !$0.found })
    }

    // Reset all clues to unfound state
    func resetClues() {
        for index in clues.indices {
            clues[index].found = false
            clues[index].image = nil
        }
        foundCount = 0
    }
}
