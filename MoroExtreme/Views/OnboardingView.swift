import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var userName = ""
    @State private var keyboardHeight: CGFloat = 0
    
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false

    var body: some View {
        ZStack {
            Group {
                switch currentPage {
                case 0:
                    OnboardingPage1()
                case 1:
                    OnboardingPage2()
                case 2:
                    OnboardingPage3()
                default:
                    OnboardingPage1()
                }
            }
            .animation(.default, value: currentPage)
            
            VStack {
                Spacer()
                
                VStack(spacing: 16) {
                    PageIndicator(currentPage: currentPage, totalPages: 3)
                    
                    ActionButton(
                        title: currentPage == 2 ? "Start" : "Next"
                    ) {
                        if currentPage < 2 {
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

struct OnboardingPage1: View {
    var body: some View {
        VStack(spacing: -50) {
            Image(.onboarding1)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            
            Text("Hi! I’m Moro. I’ve ridden every track there is and know everything about bikes.")
                .font(.system(size: 28, weight: .bold))
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}

struct OnboardingPage2: View {
    var body: some View {
        VStack(spacing: -50) {
            Image(.onboarding2)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            
            Text("Let me help you find the perfect two-wheeled ride for you.")
                .font(.system(size: 28, weight: .bold))
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}

struct OnboardingPage3: View {
    var body: some View {
        VStack(spacing: -50) {
            Image(.onboarding3)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            
            Text("Just pick a type — and I’ll explain everything in simple terms! Ready to roll?")
                .font(.system(size: 28, weight: .bold))
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}

struct ActionButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        }label: {
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
