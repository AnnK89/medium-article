class SessionView
  def ask_for(message)
    puts message
    print "> "
    gets.chomp
  end
end
