import SwiftUI

struct FilterButtonStyle: ButtonStyle {
    var selected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(selected ? Color.blue : Color.gray.opacity(0.2))
            .foregroundColor(selected ? .white : .primary)
            .cornerRadius(8)
    }
}
