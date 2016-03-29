# CHAPTER 4
# ---------

# Write a program which asks for a person's first name, then middle, then last. Finally, it should greet the person using their full name.

print "What is your first name? "
first_name = gets.chomp
print "What is your middle name? "
middle_name = gets.chomp
print "What is your last name? "
last_name = gets.chomp
puts "Hello there, #{first_name} #{middle_name} #{last_name}!"



# Write a program which asks for a person's favorite number. Have your program add one to the number, then suggest the result as a bigger and better favorite number. (Do be tactful about it, though.)

print "What is your favorite number? "
input = gets.chomp.to_i
puts "#{input + 1} is a bigger and better favorite number!"