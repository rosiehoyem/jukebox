# encoding: utf-8

songs = [
"The Phoenix - 1901",
"Tokyo Police Club - Wait Up",
"Sufjan Stevens - Too Much",
"The Naked and the Famous - Young Blood",
"(Far From) Home - Tiga",
"The Cults - Abducted",
"The Phoenix - Consolation Prizes"
].sort

bands = []
song_titles = []
songs.each do |song|
  bands << song.split(" - ")[0]
  song_titles << song.split(" - ")[1]
end


song_titles = []
songs.each { |song| song_titles << song.split(" - ").last.downcase }

def songs_with_index(songs)
  songs.each_with_index do |song, index|
    puts "#{index+1}: #{song}"
  end
end

exit = false
puts "♫   Hello, please enter one of the following commands: ♫"
puts "help, play, list, exit".center(50)


while exit == false
  print "♫  "
  input = gets.chomp.downcase

  case input

  when "help"
    puts "Please enter one of the following commands:"
    puts "help, play, list, exit"
  when "list"
    songs_with_index(songs)



  when "play"
    possibilities = []
    puts "Select a song"
    song_selection = gets.chomp.downcase
    songs.each do |song|
      possibilities << band(songs(song)) if song.downcase.include?(song_selection)
      possibilities << song_titles(songs(song)) if song.include?(song_selection)
    end
    case possibilities
    when 1
      puts "Now playing #{possibilities}"
    when 0
      puts "That is not a valid option.  Please select from the list."
      puts songs
    else
      puts "\n"
      puts "Did you mean one of these songs?"
      puts "\n"
      puts possibilities
      puts "\n"
      puts "Select from the list above or type 'Cancel'"
      specific_song = gets.chomp.downcase
    end



  when "exit"
    puts "Goodbye!"
    break
  else
    puts "Please enter a valid command:"
    puts "help, play, list, exit"
  end
end
