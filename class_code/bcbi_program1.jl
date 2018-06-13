#
#  biol6535_program1.jl
#  First program written in Julia.
#
#  Created by BCBI on 2017-02-06.
#  Last Updated by BCBI on 2018-06-11.
#  Copyright 2018 Brown University. All rights reserved.
#

#=

# introduce script
println("hello, welcome to my first script!")

# ask if the user is having a nice day
print("Are you having a nice day? ")

# get response from <STDIN>
user_response = readline(STDIN)

# tell user what they said
println("I'm happy to hear that you said \"$user_response\"")

# ask user for a number, then convert to integer (Int64) or float (Float64)
print("what is your favorite number? ")
fav_number = parse(Float64, readline(STDIN))

# double number
double_fav_number = fav_number * 2

# report twice the number
println("twice your number is $double_fav_number")

# indicate if twice value is larger than 5
if double_fav_number > 5
    println("double your number is more than 5")
end

=#


#### BEGIN IN-CLASS CLASS EXERCISE ####

# have the computer ask for your name
print("what is your name? ")
user_name = readline(STDIN)

# have the computer print out your name
println("nice to meet you, $user_name")

# ask user for a number >> convert to Float64
print("give me a number: ")
num = parse(Float64, readline(STDIN))

# if number is greater than 10 divide by 2, and add 3
if num > 10
    new_num = (num/2) + 3
    println("your new number is $new_num")

# otherwise, tell user the number is less than 10
else
    println("you dope! that number is less than 10!")
end

