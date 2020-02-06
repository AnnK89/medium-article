# Very dirty code that needs refactoring...
def hop_hop_hop(number_of_exercises)
  # for i in (1..number_of_exercises) do
  (1..number_of_exercises).each { |number| print "hop! " * number + 'One more time...' + "\n" }
end




hop_hop_hop(6)
