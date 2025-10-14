import SwiftUI

struct BikeDetailView: View {
    let bike: Bike
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 0) {
                    Image(bike.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .shadow(color: .gray, radius: 3, x: 1, y: 3)
                        .overlay(alignment: .bottom) {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.black.opacity(0.3))
                                .blur(radius: 7)
                                .frame(height: 70)
                        }
                        .overlay(alignment: .bottomLeading) {
                            Text(bike.name)
                                .foregroundStyle(.white)
                                .font(.system(size: 24, weight: .bold))
                                .padding()
                        }
                    
                    Text(bike.fullDescription)
                        .font(.system(size: 20))
                        .foregroundColor(.primary)
                        .lineSpacing(4)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    
                    Spacer(minLength: 190)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            
            VStack {
                Spacer()
                KeyFeaturesView(features: bike.features)
                    .padding()
            }
        }
    }
}

struct KeyFeaturesView: View {
    let features: [Feature]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Key Features")
                .foregroundStyle(.primary)
                .font(.system(size: 20, weight: .bold))
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(features.indices, id: \.self) { index in
                    FeatureRow(feature: features[index])
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 1, y: 3)
        )
    }
}

struct FeatureRow: View {
    let feature: Feature
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: feature.isPositive ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundColor(feature.isPositive ? .green : .red)
                .font(.system(size: 20))
            
            Text(feature.text)
                .font(.system(size: 15))
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    BikeDetailView(bike: Bike(
        id: "mountain",
        name: "Mountain (MTB)",
        shortDescription: "For off-road adventures.",
        fullDescription: "Meet the Mountain King! He's fearless — mud, rocks, and steep trails are his playground.",
        imageName: "folding",
        features: [
            Feature(text: "off-road, trails, mountains", isPositive: true),
            Feature(text: "durable, grippy", isPositive: true),
            Feature(text: "heavy, slower on asphalt", isPositive: false)
        ]
    ))
}
