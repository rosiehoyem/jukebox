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
    puts "Would you like to select song by name or index?"
    name_or_index_response = gets.chomp.downcase
    while name_or_index_response != "index" || name_or_index_response != "name"
      case name_or_index_response
      when "index"
        songs_with_index(songs)
        puts "Please select the index of the song you want to hear from the list above:"
        index_choice = gets.chomp.downcase
        puts "Playing #{sprint_to_screen("hello")songs[index_choice.to_i - 1]}"
        break
      when "name"
        songs_with_index(songs)
        puts "Please select the name of the song you want to hear from the list above:"
        name_choice = gets.chomp.downcase
        puts "Playing #{songs[song_titles.index(name_choice)]}"
        break
      else
        puts "Please select a name or an index number:"
        name_or_index_response = gets.chomp.downcase
      end



    end
  when "exit"
    puts "Goodbye!"
    exit = true
  else
    puts "Please enter a valid command:"
    puts "help, play, list, exit"
  end
end
