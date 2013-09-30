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
    song
  end
end

exit = false
puts "♫   Hello, please enter one of the following commands: ♫"
puts "help, play, list, exit".center(50)
puts "\n"


while exit == false
  print "♫  "
  raw_input = gets.chomp.downcase.split(" ")
  input = raw_input[0]
  play_spec = raw_input[1]

  case input

  when "help"
    puts "Enter one of the following commands:"
    puts "help, play, list, exit."
    puts "\n"
  when "list"
    puts "\n"
    puts songs_with_index(songs)
    puts "\n"



  when "play"
    puts "\n"
    # made a new array to contain all the bands and titles, thus allowing the user to search by either
    possibilities_bands_and_titles = []
    possibilities = []


    while possibilities.size != 1
      if play_spec
        song_selection = play_spec
      else
        puts "Select a song from the list"
        puts "\n"
        puts songs
        puts "\n"
        song_selection = gets.chomp.downcase
        puts "\n"
      end
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
        puts "Say what?  Type 'Cancel' to abort"
        puts "\n"
        puts songs
        puts "\n"
        song_selection = gets.chomp.downcase
        break if song_selection == 'cancel'
      else
        puts ["Did you mean one of these songs?", possibilities, "Select from the list above or type 'Cancel'"].join("\n") + "\n"
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
