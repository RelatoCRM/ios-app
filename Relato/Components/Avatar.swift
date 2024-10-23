import SwiftUI

struct AvatarView: View {
    var imageName: String
    var borderColor: Color = .blue
    var size: CGFloat = 100
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle()) // Make the image circular
    }
}
