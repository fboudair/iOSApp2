import SwiftUI

struct ClueCardView: View {
    var clue: Clue
    @ObservedObject var viewModel: ScavengerHuntViewModel
    @State private var selectedImage: UIImage?
    @State private var isShowingPhotoPicker = false
    @Binding var hasSubmittedPhoto: Bool 
    
    var body: some View {
        VStack {
            Text(clue.text).font(.headline)
            Text("Location: \(clue.location)").foregroundColor(.gray)
            
            if let imageData = clue.image, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage).resizable().scaledToFit().frame(height: 150)
            } else {
                Button("Take Photo") {
                    isShowingPhotoPicker = true
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
        .sheet(isPresented: $isShowingPhotoPicker) {
            ImagePicker(image: $selectedImage, completion: { imageData in
                if let imageData = imageData {
                    viewModel.markClueFound(clue, with: imageData)
                    hasSubmittedPhoto = true
                }
            })
        }
    }
}

struct ClueCardViewPreview: View {
    @State private var hasSubmittedPhoto = false
    
    var body: some View {
        ClueCardView(
            clue: Clue(text: "Find the best-selling novel at the bookstore", location: "Local Bookstore"),
            viewModel: ScavengerHuntViewModel(),
            hasSubmittedPhoto: $hasSubmittedPhoto
        )
    }
}

#Preview {
    ClueCardViewPreview()
}
