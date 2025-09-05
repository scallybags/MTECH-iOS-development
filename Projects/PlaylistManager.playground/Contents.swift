import UIKit

struct Song {
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
    
    func allSongs() -> [Song] {
        var allSongsArray: [Song] = []
        for song in songs {
            allSongsArray.append(song)
        }
        print(allSongsArray)
        return allSongsArray
    }
    
    func totalDuration() -> Int {
        var totalDuration: Int = 0
        for song in songs {
            totalDuration += song.duration
        }
        print(totalDuration)
        return totalDuration
    }
    
    func currentSong() -> Song? {
        if currentlyPlaying != nil {
            print(songs[currentlyPlaying!])
            return songs[currentlyPlaying!]
        } else {
            return nil
        }
    }

    // Playback navigation
    func play(at index: Int) -> Song? {
        currentlyPlaying = index
        print(index)
        return songs[index]
    }
    
    func playNext() -> Song? {
        if currentlyPlaying != nil {
            currentlyPlaying! += 1
            print(songs[currentlyPlaying!])
            return songs[currentlyPlaying!]
        } else {
            return nil
        }
    }

    func playPrevious() -> Song? {
        if currentlyPlaying != nil {
            currentlyPlaying! -= 1
            print(songs[currentlyPlaying!])
            return songs[currentlyPlaying!]
        } else {
            return nil
        }
    }
    
    // Shuffle
    func shuffle() {
        songs.shuffle()
    }
}

var song1 = Song(name: "Crocadile Tearz", artist: "J. Cole", duration: 4)
var song2 = Song(name: "Sugarcat", artist: "Dope Lemon", duration: 3)
var song3 = Song(name: "Marinade", artist: "Dope Lemon", duration: 4)
var song4 = Song(name: "Law & Order", artist: "BigXthaPlug", duration: 3)
var song5 = Song(name: "London Roads", artist: "Lil Wayne", duration: 4)

var myPlaylist = Playlist(name: "Big steppas playlist", author: "Andrew", songs: [], currentlyPlaying: nil)

myPlaylist.songs.append(song1)
myPlaylist.songs.append(song2)
myPlaylist.songs.append(song3)
myPlaylist.songs.append(song4)
myPlaylist.songs.append(song5)

myPlaylist.allSongs()
