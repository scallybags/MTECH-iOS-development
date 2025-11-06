import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    static var archiveURL:  = URL
    
    init() {
        if let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            archiveURL = docs.appendingPathComponent("emojis").appendingPathExtension(".plist")            
        }
    }
    
    static func saveToFile(emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(emojis)
            try data.write(to: archiveURL)
        } catch {
            print("🥸 saving error")
        }
    }
    
    static func loadFromFile() -> [Emoji] {
        
    }
}
