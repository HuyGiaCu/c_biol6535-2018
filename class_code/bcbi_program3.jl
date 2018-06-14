#
#  bcbi_program3.jl
#  Arrays, Sets, and Dictionaries
#
#  Created by BCBI on 2017-02-27.
#  Last Updated by BCBI on 2018-06-14.
#  Copyright 2018 Brown University. All rights reserved.
#


# instantiate an array to keep track of words
word_array = []

# ask user for a phrase, and be sure it is at least 10 words long
print("Enter a phrase: ")
phrase = readline(STDIN)
println("Your phrase is: $(phrase)")
word_array = split(phrase, " ")

println("length is: $(length(word_array))")

println("First element in the array is: $(word_array[1])")

# pull out characters 5-10 and tell the user what they are
select_text = phrase[5:10]
println("the characters from postion 5 to 10 are: $select_text")

# if the phrase is less than 10 words, have user re-enter phrase
while length(word_array) <= 10
    print("Your phrase is too short; enter a phrase of at least 10 words in length: ")
    phrase = readline(STDIN)
    word_array = split(phrase, " ")
end

# report the words from the phrase from the array
for word in word_array
    println("<array>word in phrase is: $word")
end

# load the array into a Set
word_set = Set()
for word in word_array
    push!(word_set, word)
end

# print out the unique set of words in the phrase
for word2 in word_set
    println("<set>word in phrase is: $word2")
end

# instantiate and set dictionary of fancy words
fancy_word_dict = Dict()
fancy_word_dict["wheels"] = "tyres"
#fancy_word_dict["WHEELS"] = "tyres"
fancy_word_dict["bus"] = "coach"

# report the unique words in the set, and indicate
# the words that could be fancified
for word in word_set
    println("<set>word in phrase is: $word")
    if haskey(fancy_word_dict, word)
        better_word = fancy_word_dict[word]
        println("... but a fancy word for the same is: $better_word")
    end
end

# create a dictionary lookup
secret_code_dict = Dict()
secret_code_dict["4"] = "secret code 4 (half of life meaning)"
secret_code_dict["2"] = "secret code 2 (half of life meaning)"

# pull out the character at position 1, and convert to a string
select_char = string(phrase[1])
println(typeof(select_char))

# if the secret code exists, tell user it has been unlocked
if haskey(secret_code_dict, select_char)
    println("*** SECRET UNLOCKED: $(secret_code_dict[select_char])")
end
=#
##### BEGIN CLASS EXERCISE
## Until the user types "stop,stop", ask the user for translations as key, value
## pairs that will be used to convert phrases later. Then:
##		(1) Reports the keys in the order that they were entered
##		(2) Reports the unique list of keys
##		(3) Asks the user for 5 words to translate, and reports the translation

#key_val_pair = ""
key_array = []
key_set = Set()
translate_dict = Dict()

print("enter a translation (as \"key,value\"): ")
key_val_pair = readline(STDIN)

while key_val_pair != "stop,stop"
    key_val_array = split(key_val_pair, ",")

    key = key_val_array[1]
    val = key_val_array[2]

   # println("key = $key and val = $val")

    # push key into array
    push!(key_array, key)

    # push key into set
    push!(key_set, key)

    # add pair to dictionary
    translate_dict[key] = val

    print("enter a translation (as \"key,value\"): ")
    key_val_pair = readline(STDIN)
end

println("the order that keys were entered was: ")
for key in key_array
    println(key)
end

println("which consisted of the following unique keys: ")
for key in key_set
    println(key)
end

for word_count in 1:5
    print("give me a word/phrase to translate $(word_count): ")
    translate_phrase = readline(STDIN)

    if haskey(translate_dict, translate_phrase)
        translation = translate_dict[translate_phrase]
        println("that translates to: $translation")
    else
        println("no translation available")
    end
end