import UIKit

struct Song: Equatable {
    let name: String
    let artist: String
    let duration: Int
}

class Playlist {
    let name: String
    let author: String
    var songs: [Song]
    var currentIndex: Int?
    
    // Init
    init(name: String, author: String, songs: [Song], currentlyPlaying: Song?) {
        self.name = name
        self.author = author
        self.songs = []
        self.currentIndex = nil
    }
    
    // Core mutation
    func add(_ song: Song) {
        songs.append(song)
    }
    
    func remove(at index: Int) {
        songs.remove(at: index)
    }
    
    func clear() {
        songs.removeAll()
    }

    // Querying / reading
    var count: Int { get { songs.count } }
    
    func printAllSongs(){
        print("🎶Printing all songs ")
        for song in songs {
            print("\(song.name), \(song.artist): \(song.duration) minutes")
        }
    }
    
    func totalDuration() -> Int {
        var totalDuration: Int = 0
        for song in songs {
            totalDuration += song.duration
        }
        print("Total Durantion: \(totalDuration) minutes.")
        return totalDuration
    }
    
    func currentSong() -> Song? {
        if currentIndex != nil {
            print("Currently playing \(songs[currentIndex!].name) by \(songs[currentIndex!].artist)")
            return songs[currentIndex!]
        } else {
            return nil
        }
    }

    // Playback navigation
    func play(at index: Int) -> Song? {
        currentIndex = index
        print("Now playing \(songs[index].name) by \(songs[index].artist)")
        return songs[index]
    }
    
    func playNext() -> Song? {
        if currentIndex != nil {
            currentIndex! += 1
            let isValid = currentIndex! <= songs.count - 1
            if isValid {
                play(at: currentIndex!)
                return songs[currentIndex!]
            } else {
                currentIndex = 0
                play(at: currentIndex!)
                return songs[currentIndex!]
            }
        } else {
            print("No song currently playing")
            return nil
        }
    }

    func playPrevious() -> Song? {
        if currentIndex != nil {
            currentIndex! -= 1
            let isValid = currentIndex! >= 0
            if isValid {
                play(at: currentIndex!)
                return songs[currentIndex!]
            } else {
                currentIndex = songs.count - 1
                play(at: currentIndex!)
                return songs[currentIndex!]
            }
        } else {
            print("No song currently playing")
            return nil
        }
    }
    
    // Shuffle
    func shuffle() {
        songs.shuffle()
    }
    
    func sortByName() {
        songs = songs.sorted { $0.name < $1.name }
    }
    
    func sortByDuration() {
        songs = songs.sorted { $0.duration < $1.duration }
    }
    
    func sortByArtist() {
        songs = songs.sorted { $0.artist < $1.artist }
    }
    
    func moveSong(song: Song, to index: Int) {
        if let i = songs.firstIndex(of: song) {
            songs.remove(at: i)
        }
        songs.insert(song, at: index)
    }
}

var s1 = Song(name: "Crocadile Tearz", artist: "J. Cole", duration: 4)
var s2 = Song(name: "Sugarcat", artist: "Dope Lemon", duration: 3)
var s3 = Song(name: "Marinade", artist: "Dope Lemon", duration: 4)
var s4 = Song(name: "Law & Order", artist: "BigXthaPlug", duration: 3)
var s5 = Song(name: "London Roads", artist: "Lil Wayne", duration: 4)

var myPlaylist = Playlist(name: "Big steppas playlist", author: "Andrew", songs: [], currentlyPlaying: nil)

myPlaylist.add(s1)
myPlaylist.add(s2)
myPlaylist.add(s3)
myPlaylist.add(s4)
myPlaylist.add(s5)
myPlaylist.printAllSongs()
print("--")
myPlaylist.play(at: 0)
print("--")
myPlaylist.playPrevious()
print("--")
myPlaylist.printAllSongs()
print("--")
myPlaylist.playNext()
