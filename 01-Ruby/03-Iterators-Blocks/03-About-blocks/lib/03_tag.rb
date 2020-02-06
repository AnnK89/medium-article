def tag(tag_name, attributes = nil)
  # TODO: Build HTML tags around content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  if attributes.nil?
    return "<#{tag_name}>#{yield}</#{tag_name}>"
  else
    # return "<#{tag_name} #{attributes[0]}=\"#{attributes[1]}\">#{yield}</#{tag_name}>"
    return "<#{tag_name} #{attributes[0]}=\"#{attributes[1]}\">#{yield}</#{tag_name}>"
  end
end


# tag("h1") do
#   "Some Title"
# end
# #=> "<h1>Some Title</h1>"

# tag("a", ["href", "www.google.com"]) do
#   "Google it"
# end
# => '<a href="www.google.com">Google it</a>'

# tag("a", ["href", "www.google.com"]) do
#   tag("h1") do
#     "Google it"
#   end
# end
# => '<a href="www.google.com"><h1>Google it</h1></a>'
