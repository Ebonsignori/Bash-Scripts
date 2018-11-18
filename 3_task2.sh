#!/usr/bin/env bash

declare -i integer=$1
first_name=$2
last_name=$3
declare -i month_of_birth=$4
declare -i year_of_birth=$5

## Add leading 0 to month if needed
if [[ "$month_of_birth" -lt 10 ]]
then
    month_of_birth=$(printf "%02d" ${month_of_birth})
fi

## Determine if integer is even or odd
if [[ "$((integer % 2))" -eq 0 ]]
then
  birth_date="$(gdate -d "${year_of_birth}/${month_of_birth}/01" +%m/%Y)"
  echo "${first_name} ${last_name} was born on ${birth_date} of the Gregorian calendar"
else
  ## Convert to Julian date
  jd=$((1 - 32075 + 1461 * (year_of_birth + 4800 - (14 - month_of_birth) / 12) / 4 + 367 * (month_of_birth - 2 + ((14 - month_of_birth) / 12) * 12) / 12 - 3 * ((year_of_birth + 4900 - (14 - month_of_birth) / 12) / 100) / 4))
  echo "${first_name} ${last_name} was born on ${jd} of the Julian calendar"
fi