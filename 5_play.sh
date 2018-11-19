#!/usr/bin/env bash

#!/usr/bin/env bash

## Initialize variables
declare -a number_post_fixes=("st" "nd" "rd" "th")
declare -a suits=("Spades" "Hearts" "Diamonds" "Clubs")
declare -a ranks=("Ace" "Two" "Three" "Four" "Five" "Six" "Seven" "Eight" "Nine" "Ten" "Jack" "Queen" "King")
declare -a user_suit_array=()
declare -a user_rank_array=()
declare -a rank_sums=(0 0 0 0)

## Give user a description of the program
echo "Enter 5 cards. For each card you will enter two numbers."
echo "The first number (1 - 4) represents the suits: Spades, Hearts, Diamonds, and Clubs respectively"
echo "The second number (1 - 13) represents numbers Ace,  2 - 10, Jack, Queen, and King respectively"
echo "For example: '2 13' would be The King of Hearts"

## Prompt and read in each of 5 cards
for number in 1 2 3 4 5
do
    ## Get current number post_fix
    if [[ "$number" -lt 4 ]]
    then
        post_fix=${number_post_fixes[$((number-1))]}
    fi
    echo "Enter the ${number}${post_fix} card"
    read -a card_array

    ## If the user didn't enter 2 numbers representing the card, keep prompting until they do
    declare -i input_length=${#card_array[@]}
    while [[ "$input_length" -ne 2 ]]
    do
        echo "You must enter 2 numbers separated by spaces: #1:The suit #2:The Card"
        echo "Reenter the ${number}${post_fix} card"
        read -a card_array
     input_length=${#card_array[@]}
    done

   ## If the user didn't enter numbers in the suit and rank range, prompt for correct numbers
    declare -i is_valid_card=1
    if [[ ${card_array[0]} -lt 1 ]] || [[ ${card_array[0]} -gt 4 ]]
    then
      echo "Please enter a suit (first number) between 1 and 4"
      is_valid_card=0
    elif [[ ${card_array[1]} -lt 1 ]] || [[ ${card_array[1]} -gt 13 ]]
    then
      echo "Please enter a rank (second number) between 1 and 13"
      is_valid_card=0
    fi

    ## Keep prompting until the user enters a valid card
    while [[ ${is_valid_card} -ne 1 ]]
    do
        echo "Reenter the ${number}${post_fix} card"
        read -a card_array

        is_valid_card=1
        if [[ ${card_array[0]} -lt 1 ]] || [[ ${card_array[0]} -gt 4 ]]
        then
          echo "Please enter a suit (first number) between 1 and 4"
          is_valid_card=0
        elif [[ ${card_array[1]} -lt 1 ]] || [[ ${card_array[1]} -gt 13 ]]
        then
          echo "Please enter a rank (second number) between 1 and 13"
          is_valid_card=0
        fi
    done

    ## Append card to each array
    user_suit_array+=(${card_array[0]})
    user_rank_array+=(${card_array[1]})
done

## Print results
echo "You've entered 5 cards:"
for number in 1 2 3 4 5
do
    ## Get current number post_fix
    if [[ "$number" -lt 4 ]]
    then
      post_fix=${number_post_fixes[$((number-1))]}
    fi

    ## Get the suit and rank of the card
    suits_index=$((user_suit_array[$((number-1))]-1))
    suit=${suits[${suits_index}]}
    rank_amount=${user_rank_array[$((number-1))]}
    rank=${ranks[$((rank_amount-1))]}
    echo "Your ${number}${post_fix} card is The ${rank} of ${suit}"

    ## Add to total rank per suit
    rank_sums[${suits_index}]=$((${rank_sums[${suits_index}]}+${rank_amount}))
done

## Print the total rank per each suit
echo "The total ranks for each suit are:"
echo "Spades: ${rank_sums[0]}"
echo "Hearts: ${rank_sums[1]}"
echo "Diamonds: ${rank_sums[2]}"
echo "Clubs: ${rank_sums[3]}"

