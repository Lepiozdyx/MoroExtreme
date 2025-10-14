import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false
    
    private let pages: [(image: ImageResource, text: String)] = [
        (.onboarding1, "Hi! I'm Moro. I've ridden every track there is and know everything about bikes."),
        (.onboarding2, "Let me help you find the perfect two-wheeled ride for you."),
        (.onboarding3, "Just pick a type — and I'll explain everything in simple terms! Ready to roll?")
    ]

    var body: some View {
        ZStack {
            OnboardingPage(
                image: pages[currentPage].image,
                text: pages[currentPage].text
            )
            .animation(.default, value: currentPage)
            
            VStack {
                Spacer()
                
                VStack(spacing: 16) {
                    PageIndicator(currentPage: currentPage, totalPages: pages.count)
                    
                    ActionButton(
                        title: currentPage == pages.count - 1 ? "Start" : "Next"
                    ) {
                        if currentPage < pages.count - 1 {
                            withAnimation(.spring()) {
                                currentPage += 1
                            }
                        } else {
                            hasCompletedOnboarding = true
                        }
                    }
                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct OnboardingPage: View {
    let image: ImageResource
    let text: String
    
    var body: some View {
        VStack(spacing: -50) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            
            Text(text)
                .font(.system(size: 28, weight: .bold))
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}

struct PageIndicator: View {
    let currentPage: Int
    let totalPages: Int
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<totalPages, id: \.self) { index in
                if index == currentPage {
                    Capsule()
                        .fill(.mOrange)
                        .frame(width: 32, height: 8)
                        .transition(.scale.combined(with: .opacity))
                } else {
                    Circle()
                        .fill(.clear)
                        .frame(width: 8, height: 8)
                        .transition(.scale.combined(with: .opacity))
                        .overlay {
                            Circle()
                                .stroke(.gray, lineWidth: 1)
                        }
                }
            }
        }
        .animation(.spring(response: 0.6, dampingFraction: 0.8), value: currentPage)
    }
}

struct ActionButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .heavy, design: .default))
                .padding()
                .frame(width: 310, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.mOrange)
                        .shadow(color: .gray, radius: 2, x: 1, y: 3)
                )
        }
    }
}

#Preview {
    OnboardingView()
}
