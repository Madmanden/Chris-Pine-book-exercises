# CHAPTER 10
# ----------

# Write a method which takes a block and calls it once for each hour that has passed today. 
# That way, if I were to pass in the block do puts 'DONG!' end, it would chime (sort of) like a grandfather clock. 
# Test your method out with a few different blocks (including the one I just gave you). 
# Hint: You can use  Time.now.hour to get the current hour. However, this returns a number between 0 and 23, 
# so you will have to alter those numbers in order to get ordinary clock-face numbers (1 to 12).

def clock(&block)
  time = (Time.now.hour + 1)
  time.times { block.call }
end

clock() do 
  puts 'DONG!' 
end



# Program Logger. Write a method called log, which takes a string description of a block and, of course, a block. 
# Similar to  doSelfImportantly, it should puts a string telling that it has started the block, and another string at the end telling you that it has finished 
# the block, and also telling you what the block returned. Test your method by sending it a code block. Inside the block, put another call to log, passing 
# another block to it. (This is called nesting.) In other words, your output should look something like this:

    # Beginning "outer block"...
    # Beginning "some little block"...
    # ..."some little block" finished, returning:  5
    # Beginning "yet another block"...
    # ..."yet another block" finished, returning:  I like Thai food!
    # ..."outer block" finished, returning:  false


def log(string, &block)
  puts "Beginning \"#{string}\"..."
  puts "...\"#{string}\" finished, returning: #{block.call}" 
end  

log "outer block" do
  log "some little block" do
    5
  end
  log "yet another block" do
    "I like Thai food!"
  end
end





#Better Logger. The output from that last logger was kind of hard to read, and it would just get worse the more you used it. It would be so much easier to read 
# if it indented the lines in the inner blocks. To do this, you'll need to keep track of how deeply nested you are every time the logger wants to write something.
# To do this, use a global variable, a variable you can see from anywhere in your code. To make a global variable, just precede your variable name with $, like 
# these:  $global, $nestingDepth, and $bigTopPeeWee. In the end, your logger should output code like this:

    # Beginning "outer block"...
    #   Beginning "some little block"...
    #     Beginning "teeny-tiny block"...
    #     ..."teeny-tiny block" finished, returning:  lots of love
    #   ..."some little block" finished, returning:  42
    #   Beginning "yet another block"...
    #   ..."yet another block" finished, returning:  I love Indian food!
    # ..."outer block" finished, returning:  true


$nestingDepth = 0
$space = '  '
def log(string, &block)
  puts ($space * $nestingDepth) + "Beginning \"#{string}\"..."
  $nestingDepth +=1
  returned = block.call
  $nestingDepth -=1
  puts ($space * $nestingDepth) + "...\"#{string}\" finished, returning: #{returned}" 

end  


log "outer block" do
  log "some little block" do
    log "teeny-tiny block" do
      "lots of love"
    end
    42
  end
  log "yet another block" do
    "I love Indian food!"
  end
end