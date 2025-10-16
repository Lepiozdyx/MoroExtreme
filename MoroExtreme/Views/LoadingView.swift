import SwiftUI

struct LoadingView: View {
    @State private var loading: CGFloat = 0
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue1, .blue2],
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            
            VStack {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                   
                Text("GOLDEN PATHS AWAIT")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
            }
            .padding()
            
            VStack {
                Spacer()
                
                Capsule()
                    .foregroundStyle(.white.opacity(0.1))
                    .frame(maxWidth: 250, maxHeight: 25)
                    .overlay {
                        Capsule()
                            .stroke(.blue, lineWidth: 1)
                    }
                    .overlay(alignment: .leading) {
                        Capsule()
                            .foregroundStyle(.white)
                            .frame(width: 248 * loading, height: 23)
                            .padding(.horizontal, 1)
                    }
                    .overlay {
                        Text("Loading...")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundStyle(.blue)
                    }
            }
            .padding()
        }
        .onAppear {
            withAnimation(.linear(duration: 4)) {
                loading = 1
            }
        }
    }
}

#Preview {
    LoadingView()
}
