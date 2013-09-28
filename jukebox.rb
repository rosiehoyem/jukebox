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
    possibilities = songs.clone
    puts "Select a song"
    song_selection = gets.chomp.downcase
    possibilities.map do |song|
      while possibilities.size > 1
        
        break if song_selection == "cancel"
        possibilities.delete(song) if !song.downcase.include?(song_selection) 
        
        puts "Please be more specific.  Select from the list of matches below, or type 'Cancel'"
        puts possibilities
        puts "\n"
        song_selection = gets.chomp.downcase
        
      end
    end
    puts "Playing #{possibilities[0]}"


  when "exit"
    puts "Goodbye!"
    break
  else
    puts "Please enter a valid command:"
    puts "help, play, list, exit"
  end
end
