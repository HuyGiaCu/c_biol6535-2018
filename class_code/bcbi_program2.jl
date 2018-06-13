#
#  bcbi_program2.jl
#  Strings, characters, and regular expressions
#  Conditional statements and control structures
#
#  Created by BCBI on 2017-02-013.
#  Last Updated by BCBI on 2018-06-13.
#  Copyright 2018 Brown University. All rights reserved.
#

# ask user to enter a phrase
println("hello and welcome to today's program")
print("please enter a phrase: ")
phrase = readline(STDIN)

# check if extra space at end of phrase and remove
println("original phrase: \"$phrase\"")
if ismatch(r"\s$", phrase)
    phrase = chop(phrase)
end

# tell user what they entered
print("you entered \"")
print(phrase)
print("\"\n")

# determine length of phrase
phrase_length = length(phrase)

# inform user about the length of the phrase
println("... the length of the phrase is $phrase_length characters long")

# if the phrase length is less than 10 characters, tell user
if phrase_length < 10
    println("less than 10 characters long")
# otherwise if the phrase length is 10 characters, tell user
elseif phrase_length == 10
    println("exactly ten characters long")
# or, just default to telling the user that they entered a phrase
else
    println("just fine in length")
end    
# if phrase is or contains a particular word
if phrase == "hello"
    println("welcome to program")
elseif contains(phrase, "good") || contains(phrase, "bad")
    println("phrase includes good or bad")
end
print("\n-------\n")


### WHILE LOOP ###
# while the phrase is less than 10 characters, ask user to enter another phrase
while phrase_length <= 10 
    println("your phrase \"$phrase\" is less than 10 characters in length ...")
    print("please enter another phrase: \n")
    phrase = readline(STDIN)
    phrase_length = length(phrase)
end

###  FOR LOOP ### 
# for every number between 1 and length of the string,
# print out the character at each position in string
for number in 1:phrase_length
    pos_character = phrase[number]
    println("character at position $number: $pos_character")
end

first_char = phrase[1]
substring = phrase[2:4]
last_char = phrase[phrase_length]
print("first = $first_char --- substring = $substring --- last = $last_char\n")

### REGULAR EXPRESSIONS ###
# if phrase has letters abcd, tell user
if ismatch(r"[abcd]", phrase)
    println("your phrase has either an a, b, c, or d!")
else
    println("your phrase does not have either an a, b, c, or d!")
end

# if phrase has numbers 0-9, tell user
if ismatch(r"[0-9]", phrase)
    println("your phrase has a number in it!")
else
    println("your phrase does not have a number in it!")
end

# if phrase has sequence of lowercase letter, number, and uppercase letter, tell user
if ismatch(r"[a-z][0-9][A-Z]", phrase)
    println("your phrase contains a lowercase-number-uppercase sequence!")
else
    println("your phrase does not contain a lowercase-number-uppercase sequence!")
end

### BEGIN IN-CLASS EXERCISE ###
# write a program that asks user to enter a date, and then verify that
# the date was entered in the correct format (mm/dd/yyyy); if the date is
# entered correctly, ask the user to enter another date.
# Note: does not need a valid date, just the right format.

print("welcome! what is your favorite date? (mm/dd/yyyy): ")
user_date = readline(STDIN)

# options for regular expression:
# [0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]
# [0-9]{2}/[0-9]{2}/[0-9]{4}
# \d{2}|\d{2}|\d{4}
# (0[1-9]|1[012])/([012][0-9]|3[01])/\d{4} --- includes some validation for month/day

while !ismatch(r"^[0-9]{2}/[0-9]{2}/[0-9]{4}$", user_date)
    println("right format!")
    print("enter another date (mm/dd/yyyy): ")
    user_date = readline(STDIN)
end
