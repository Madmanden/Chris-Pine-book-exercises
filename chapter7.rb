# CHAPTER 7
# ---------

# Write the program we talked about at the very beginning of this chapter.

# Let's write a program which asks us to type in as many words as we want 
# (one word per line, continuing until we just press Enter on an empty line), 
# and which then repeats the words back to us in alphabetical order.

arr = []

print "Input words: "
arr << input = gets.chomp

while input != ""
  print "Input words: "
  arr << input = gets.chomp
end

arr.pop
puts ""
puts "Here are your words in alphabetical order: "
p arr.sort







# Rewrite your Table of Contents program (from the chapter on methods). Start the program with an array holding all of the information for your Table of Contents (chapter names, page numbers, etc.). Then print out the information from the array in a beautifully formatted Table of Contents.

arr = [["Chapter 1:  Numbers", "Chapter 2:  Letters", "Chapter 3:  Variables"], ["page 1", "page 72", "page 118"]]

lineWidth = 60
puts "Table of Contents".center lineWidth
puts arr.first.first.ljust(lineWidth/2) + arr.last.first.rjust(lineWidth/2)
puts arr[0][1].ljust(lineWidth/2) + arr[1][1].rjust(lineWidth/2)
puts arr.first.last.ljust(lineWidth/2) + arr.last.last.rjust(lineWidth/2)