# encoding: utf-8
# Download Gist: https://gist.github.com/scottcreynolds/e6534b284373efe0ba6e/download
# Build a Jukebox
 
# create a file jukebox.rb
 
# When that program is run, it should introduce itself
# to the user and accept input from the user using the gets command.
 
# The jukebox should respond to 4 commands, help, play, list and exit.
 
# The help command should output instructions for the user
# on how to use the jukebox.
 
# The list command should output a list of songs that the
# user can play.
 
# the play command should accept a song, either by number/index
# or name. Once the user has indicated which song they want to
# play, the jukebox should output 'Playing The Phoenix - 1901'
# or whatever song name is important.
 
# if the user types in exit, the jukebox should say goodbye
# and the program should shut down.
 
# Think about the following things
 
# How to keep the program running until the exit command is
# executed (Hint: Loop maybe? Loop upon a condition)
 
# How to normalize the user's input so LIST and list are the
# same. (Hint, maybe downcase and strip it)
 
# How to give the songs an "index" so that when you list them
# out, you can refer to them by position so the user can just
# type play 1 and then you find the first song. (Hint, check
# out a method called each_with_index)

songs = [
"The Phoenix - 1901",
"Tokyo Police Club - Wait Up",
"Sufjan Stevens - Too Much",
"The Naked and the Famous - Young Blood",
"(Far From) Home - Tiga",
"The Cults - Abducted",
"The Phoenix - Consolation Prizes"
].sort

song_titles = []
songs.each { |song| song_titles << song.split(" - ").last.downcase }


exit = false
puts "♫   Hello, please enter one of the following commands: ♫"
puts "help, play, list, exit".center(50)
while exit == false
  print "♫  "
  input = gets.chomp.downcase

  if input == "help"
    puts "please enter one of the following commands:"
    puts "help, play, list, exit"
  end

  if input == "list"
    songs.each_with_index do |song, index|
      puts "#{index+1}: #{song}"
    end
  end

  if input == "play"
    puts "Select song by name or index:"
    song_selection = gets.chomp.downcase
    if song_selection.length < 2 && song_selection.match(/[1-9]/)
      puts "Playing #{songs[song_selection.to_i - 1]}"
    elsif song_titles.include?(song_selection)
      puts "Playing #{songs[song_titles.index(song_selection)]}"
    end
  end


  if input == "exit"
    puts "Goodbye!"
    exit = true
  end
end
