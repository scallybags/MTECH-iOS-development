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
    var currentlyPlaying: Int?
    
    // Init
    init(name: String, author: String, songs: [Song], currentlyPlaying: Song?) {
        self.name = name
        self.author = author
        self.songs = []
        self.currentlyPlaying = nil
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
    
    func allSongs(){
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
        if currentlyPlaying != nil {
            print("Currently playing \(songs[currentlyPlaying!].name) by \(songs[currentlyPlaying!].artist)")
            return songs[currentlyPlaying!]
        } else {
            return nil
        }
    }

    // Playback navigation
    func play(at index: Int) -> Song? {
        currentlyPlaying = index
        print("Now playing \(songs[index].name) by \(songs[index].artist)")
        return songs[index]
    }
    
    func playNext() -> Song? {
        if currentlyPlaying != nil {
            currentlyPlaying! += 1
            print("Now playing \(songs[currentlyPlaying!].name) by \(songs[currentlyPlaying!].artist)")
            return songs[currentlyPlaying!]
        } else {
            return nil
        }
    }

    func playPrevious() -> Song? {
        if currentlyPlaying != nil {
            currentlyPlaying! -= 1
            print("Now playing \(songs[currentlyPlaying!].name) by \(songs[currentlyPlaying!].artist)")
            return songs[currentlyPlaying!]
        } else {
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

myPlaylist.songs.append(s1)
myPlaylist.songs.append(s2)
myPlaylist.songs.append(s3)
myPlaylist.songs.append(s4)
myPlaylist.songs.append(s5)

myPlaylist.allSongs()
print("--")
myPlaylist.moveSong(song: s2, to: 4)
myPlaylist.allSongs()
print("--")
myPlaylist.play(at: 1)
myPlaylist.currentSong()
myPlaylist.totalDuration()
