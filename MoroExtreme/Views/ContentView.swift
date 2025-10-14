import SwiftUI

struct ContentView: View {
    private let bikes = BikesManager.shared.bikes
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Image(.menu)
                    .resizable()
                    .scaledToFit()
                
                VStack(spacing: 16) {
                    ForEach(bikes) { bike in
                        NavigationLink(destination: BikeDetailView(bike: bike)) {
                            BikeCard(bike: bike)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .navigationTitle("Encyclopedia")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BikeCard: View {
    let bike: Bike
    
    var body: some View {
        HStack(spacing: 12) {
            Image(bike.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 110, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(bike.name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.primary)
                
                Text(bike.shortDescription)
                    .font(.system(size: 10))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                }
        )
    }
}

#Preview {
    ContentView()
}
