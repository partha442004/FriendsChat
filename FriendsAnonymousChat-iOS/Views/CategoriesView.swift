import SwiftUI

struct CategoriesView: View {
    let categories = [
        ("Dating & Flirting", "Find your match or practice your skills.", Color.pink),
        ("Deep Conversations", "Talk about life, universe, and everything.", Color.blue),
        ("Relationship Advice", "Share experiences and get help.", Color.green),
        ("Vent & Rant", "Anonymous space to let it all out.", Color.orange)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(categories, id: \.0) { cat in
                    VStack(alignment: .leading) {
                        Text(cat.0)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(cat.2)
                        Text(cat.1)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(cat.2.opacity(0.1))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Categories")
    }
}
