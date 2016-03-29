# CHAPTER 9
# ---------

# One billion seconds... Find out the exact second you were born (if you can). 
# Figure out when you will turn (or perhaps when you did turn?) one billion seconds old.

a = Time.now
b = Time.mktime(1981, 1, 29, 10, 11)

puts "I am #{(a-b).floor} seconds old right now."
puts "I was one billion seconds old at #{b + 1000000000}."







# Happy Birthday! Ask what year a person was born in, then the month, then the day. Figure out how old they are and give them a big SPANK! for each birthday they have had.

print "What year were you born: "
year = gets.chomp.to_i

print "What month were you born: "
month = gets.chomp.to_i

print "What day were you born: "
day = gets.chomp.to_i

now = Time.now
result = now - (Time.mktime(year, month, day, 11, 59))
age = (result / (60*60*24*365)).floor

age.times { puts "SPANK" }






# Make an OrangeTree class. It should have a height method which returns its height, and a oneYearPasses method, which, when called, ages the tree one year. 
# Each year the tree grows taller (however much you think an orange tree should grow in a year), and after some number of years (again, your call) the tree 
# should die. For the first few years, it should not produce fruit, but after a while it should, and I guess that older trees produce more each year than 
# younger trees... whatever you think makes most sense. And, of course, you should be able to countTheOranges (which returns the number of oranges on the tree), 
# and pickAnOrange (which reduces the @orangeCount by one and returns a string telling you how delicious the orange was, or else it just tells you that there 
# are no more oranges to pick this year). Make sure that any oranges you don't pick one year fall off before the next year.

class OrangeTree
  def initialize
    @height = 0
    @age = 0
    @orangeCount = 0
  end
  
  def height
    @height
  end
  
  def oneYearPasses
    @age += 1
    @height += 1
    @orangeCount = (@age*@age/rand(4..7)*2.7).floor if @age > 3
  end
  
  def countTheOranges
    puts "There are #{@orangeCount} oranges on your tree."
    @orangeCount
  end
  
  def pickAnOrange
    if @orangeCount > 1
      @orangeCount -= 1 
      puts "You picked an orange. It was delicious!"
    else
      puts "There are no more oranges to pick this year."
    end
  end
end

tree = OrangeTree.new
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses
tree.oneYearPasses

tree.countTheOranges
tree.pickAnOrange
tree.countTheOranges








# Write a program so that you can interact with your baby dragon. You should be able to enter commands like feed and walk, and have those methods be called 
# on your dragon. Of course, since what you are inputting are just strings, you will have to have some sort of method dispatch, where your program checks which 
# string was entered, and then calls the appropriate method.

class Dragon

  def initialize name
    @name = name
    @asleep = false
    @stuffInBelly     = 10  # He's full.
    @stuffInIntestine =  0  # He doesn't need to go.

    puts @name + ' is born.'
  end

  def feed
    puts 'You feed ' + @name + '.'
    @stuffInBelly = 10
    passageOfTime
  end

  def walk
    puts 'You walk ' + @name + '.'
    @stuffInIntestine = 0
    passageOfTime
  end

  def putToBed
    puts 'You put ' + @name + ' to bed.'
    @asleep = true
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts @name + ' snores, filling the room with smoke.'
      end
    end
    if @asleep
      @asleep = false
      puts @name + ' wakes up slowly.'
    end
  end

  def toss
    puts 'You toss ' + @name + ' up into the air.'
    puts 'He giggles, which singes your eyebrows.'
    passageOfTime
  end

  def rock
    puts 'You rock ' + @name + ' gently.'
    @asleep = true
    puts 'He briefly dozes off...'
    passageOfTime
    if @asleep
      @asleep = false
      puts '...but wakes when you stop.'
    end
  end

  private

  # "private" means that the methods defined here are
  # methods internal to the object.  (You can feed
  # your dragon, but you can't ask him if he's hungry.)

  def hungry?
    # Method names can end with "?".
    # Usually, we only do this if the method
    # returns true or false, like this:
    @stuffInBelly <= 2
  end

  def poopy?
    @stuffInIntestine >= 8
  end

  def passageOfTime
    if @stuffInBelly > 0
      # Move food from belly to intestine.
      @stuffInBelly     = @stuffInBelly     - 1
      @stuffInIntestine = @stuffInIntestine + 1
    else  # Our dragon is starving!
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' is starving!  In desperation, he ate YOU!'
      exit  # This quits the program.
    end

    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      puts 'Whoops!  ' + @name + ' had an accident...'
    end

    if hungry?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + '\'s stomach grumbles...'
    end

    if poopy?
      if @asleep
        @asleep = false
        puts 'He wakes up suddenly!'
      end
      puts @name + ' does the potty dance...'
    end
  end

end


  pet = Dragon.new 'Norbert'
  input = ''
  
  while (input.downcase != "quit") do
    print "Type your command: "
    input = gets.chomp
    case input
    when "feed" then pet.feed
    when "walk" then pet.walk
    when "rock" then pet.rock
    when "toss" then pet.toss
    when "put to bed" then pet.putToBed
    end
  end
  
  puts ''
  puts "Thanks for playing!"