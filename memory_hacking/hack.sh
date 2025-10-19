#! /usr/bin/env bash

base_command="./main password"
password="password"
sequence="0"

# loop indefinitely
while true; do
  # position of the second 'p'
  pos_second_p=$(echo "$password" | awk -v n=2 -F'p' '{if (NF>=n) {print length($1) + n - 2}}')

  # insert the growing sequence before the second 'p'
  new_password="${password:0:pos_second_p}${sequence}${password:pos_second_p}"

  # run cmd
  echo new_password: $new_password
  $base_command "$new_password"
  echo ""
  
  password=$new_password
  
  sleep 1
done
