songs = [
"The Phoenix - 1901",
"Tokyo Police Club - Wait Up",
"Sufjan Stevens - Too Much",
"The Naked and the Famous - Young Blood",
"(Far From) Home - Tiga",
"The Cults - Abducted",
"The Phoenix - Consolation Prizes"
].sort


possibilities = []
puts "Select a song"
song_selection = "the".downcase
songs.each do |song|
  possibilities << song if song.downcase.include?(song_selection)   
end
puts possibilities