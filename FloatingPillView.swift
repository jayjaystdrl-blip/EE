import SwiftUI

struct FloatingPillView: View {
    let title: String
    let subtitle: String
    let progress: Double

    @State private var offset: CGSize = .zero
    @State private var expanded = false

    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 10) {
                Image(systemName: expanded ? "waveform.circle.fill" : "circle.fill")
                    .font(.title3)

                if expanded {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(title)
                            .font(.headline)
                            .lineLimit(1)
                        Text(subtitle)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }

                    ProgressView(value: progress)
                        .frame(width: 70)
                }
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 16)
            .frame(height: expanded ? 64 : 38)
            .background(.black, in: Capsule())
            .shadow(radius: 8)
            .onTapGesture {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                    expanded.toggle()
                }
            }
        }
        .offset(offset)
        .gesture(
            DragGesture()
                .onChanged { offset = $0.translation }
        )
        .accessibilityLabel("Floating status pill")
    }
}
