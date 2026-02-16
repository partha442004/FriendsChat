import SwiftUI

struct GamesView: View {
    let games = [
        ("Truth or Dare", "Play with your anonymous partner!", Color.blue),
        ("Random Trivia", "Test your knowledge together.", Color.pink),
        ("Icebreakers", "Never run out of things to talk about.", Color.green),
        ("Never Have I Ever", "Reveal your secrets anonymously.", Color.orange),
        ("Would You Rather", "Difficult choices, funny results.", Color.purple)
    ]
    
    var body: some View {
        List {
            ForEach(games, id: \.0) { game in
                VStack(alignment: .leading) {
                    Text(game.0)
                        .font(.headline)
                        .foregroundColor(game.2)
                    Text(game.1)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Fun Games")
    }
}
