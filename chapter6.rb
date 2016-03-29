# CHAPTER 6
# ---------

# 99 bottles of beer on the wall..." Write a program which prints out the lyrics to that beloved classic, that field-trip favorite: "99 Bottles of Beer on the Wall."
bottles = 99
while bottles > 1 do
  puts "#{bottles} Bottles of Beer on the Wall."
  bottles -= 1
  if bottles == 1
    puts "1 Bottle of Beer on the Wall."
  end
end




# Write a Deaf Grandma program. Whatever you say to grandma (whatever you type in), she should respond with  HUH?!  SPEAK UP, SONNY!, unless you shout it (type in all capitals). If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938! To make your program really believable, have grandma shout a different year each time; maybe any year at random between 1930 and 1950. (This part is optional, and would be much easier if you read the section on Ruby's random number generator at the end of the methods chapter.) You can't stop talking to grandma until you shout BYE.
input = gets.chomp
loop do
year = rand(1930..1950)
  if input != input.upcase
    puts "HUH?! SPEAK UP, SONNY!"
    input = gets.chomp
  elsif input == 'BYE'
    break
  else
    puts "NO, NOT SINCE #{year}!"
    input = gets.chomp
  end
end



# Extend your Deaf Grandma program: What if grandma doesn't want you to leave? When you shout BYE, she could pretend not to hear you. Change your previous program so that you have to shout BYE three times in a row. Make sure to test your program: if you shout BYE three times, but not in a row, you should still be talking to grandma.
input = gets.chomp
bye_count = 0
loop do
year = rand(1930..1950)
  if input == 'BYE'
    bye_count += 1
    if bye_count == 3
      break
    end
    input = gets.chomp
  elsif input != input.upcase
    puts "HUH?! SPEAK UP, SONNY!"
    bye_count = 0
    input = gets.chomp
  elsif input == ''
    bye_count = 0
    input = gets.chomp
  else #input == input.upcase
    bye_count = 0
    puts "NO, NOT SINCE #{year}!"
    input = gets.chomp
  end
end




# Leap Years. Write a program which will ask for a starting year and an ending year, and then puts all of the leap years between them (and including them, if they are also leap years). Leap years are years divisible by four (like 1984 and 2004). However, years divisible by 100 are not leap years (such as 1800 and 1900) unless they are divisible by 400 (like 1600 and 2000, which were in fact leap years). (Yes, it's all pretty confusing, but not as confusing as having July in the middle of the winter, which is what would eventually happen.)
print "Starting year: "
start_year = gets.to_i
print "Ending year: "
end_year = gets.to_i

arr = (start_year..end_year).to_a

leap = arr.select do |i| 
  (i % 4 == 0) && ((i % 100 != 0) || (i % 400 == 0))
end

print "These are leap years: #{leap}."