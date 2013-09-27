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
    possibilities = songs.clone
    temp_array = []
    puts "Select song by name or index:"
    song_selection = gets.chomp.downcase
    possibilities.map do |song|
      while possibilities.size > 1
        possibilities.delete(song) if !song.downcase.include?(song_selection) 
        
        puts "Please be more specific.  Select from the list of matches below, or type 'Cancel'"
        puts possibilities
        song_selection = gets.chomp.downcase
        break if song_selection == "cancel"
      end
    end
    puts "Playing #{possibilities[0]}"
  end


  if input == "exit"
    puts "Goodbye!"
    exit = true
  end
end
