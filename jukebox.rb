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
puts "\n"


while exit == false
  print "♫  "
  input = gets.chomp.downcase

  case input

  when "help"
    puts "Enter one of the following commands:"
    puts "help, play, list, exit."
    puts "\n"
  when "list"
    songs_with_index(songs)



  when "play"
    puts "\n"
    puts songs
    puts "\n"
    # made a new array to contain all the bands and titles, thus allowing the user to search by either
    possibilities_bands_and_titles = []
    possibilities = []
    puts "Select a song from the list"
    puts "\n"

    while possibilities.size != 1
      song_selection = gets.chomp.downcase
      possibilities_bands_and_titles.clear
      possibilities.clear
      songs.each do |song|
        if song.downcase.include?(song_selection)
          possibilities_bands_and_titles << bands[songs.index(song)] 
          possibilities_bands_and_titles << song_titles[songs.index(song)]
        possibilities << song
        end

      end
      break if song_selection == 'cancel'

      case possibilities.size

      when 1
        puts "Now playing #{possibilities}"
      when 0
        puts "Say what?  Please select from the list or type 'Cancel'"
        puts "\n"
        puts songs
        puts "\n"
      else
        puts "\n"
        puts "Did you mean one of these songs?"
        puts "\n"
        puts possibilities
        puts "\n"
        puts "Select from the list above or type 'Cancel'"
        puts "\n"
      end

    end



  when "exit"
    puts "Goodbye!"
    break
  else
    puts "Please enter a valid command:"
    puts "help, play, list, exit"
  end
end
