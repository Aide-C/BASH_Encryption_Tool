#!/bin/bash
echo "============================================="
echo "     Secure Encryption & Decryption Tool     "
echo "============================================="

read -p "Choose (1) to encrypt a message or (2) to decrypt a message:" choice
case $choice in 
  1)
    while [ -z "$message" ]
    do
      read -r -p "Enter your secret message (Use \n to start a new line):" message
    done
    
    while [[ ! "$password" =~ [[:upper:]] || ! "$password" =~ [[:lower:]] || ! "$password" =~ [[:digit:]] || ! "$password" =~ [[:punct:]] || ${#password} -lt 8 ]]
    do
      read -sp  "Enter a password for message encryption (Must be at least 8 characters and contain at least one: uppercase letter, lowercase letter, digit, and special character:" password
      echo #spacing in the terminal
    done
    
    while [ -z "$name" ]
    do
      read -p "Enter a name for the encrypted file:" name
    done
    
    while [ -f "$name.enc" ]
    do
      read -p "File name already taken. Do you wish to override the existing file? (Y or N):" input
      
      while [[ "${input^^}" != "Y" && "${input^^}" != "N" ]]
      do
        read -p "ERROR: Invalid input. Do you wish to override the existing file? (Y or N):" input
      done
      
      if [ "${input^^}" == "N" ]
      then
        read -p "Enter an unused name for the encrypted file:" name
      else
        break
      fi
      
    done
    
    echo -e $message | openssl enc -aes-256-cbc -a -salt -pbkdf2 -out "$name.enc" -pass pass:$password
    unset password
    unset message
    echo "Message was encrypted as $name.enc"
  ;;
  2)
    while [ -z $filename ]
    do
      read -p "Enter the encrypted file name you want to decrypt:" filename
    done
    
    while [ ! -f $filename ]
    do
      read -p "ERROR: This file doesn't exist. Enter the correct filename:" filename
    done
    
    while [ -z $password ]
    do
      read -sp "Enter the decryption password:" password
      echo #spacing in the terminal
    done
    
    openssl enc -aes-256-cbc -d -a -salt -pbkdf2 -in ${filename} -pass pass:$password &> ${filename/enc/dec}
    firstLine=$(head -n 1 ${filename/enc/dec})
    
    while [ "${firstLine}" == "bad decrypt" ]
    do
      read -sp "ERROR: Incorrect password. Enter the correct decryption password:" password
      echo #spacing in the terminal
      openssl enc -aes-256-cbc -d -a -salt -pbkdf2 -in ${filename} -pass pass:$password &> ${filename/enc/dec}
      firstLine=$(head -n 1 ${filename/enc/dec})
    done
    
    unset password
    cat ${filename/enc/dec}

    read -p "Message was saved as ${filename/enc/dec}. Do you wish to delete this file? (Y or N):" input
    
    while [[ "${input^^}" != "Y" && "${input^^}" != "N" ]]
    do
      read -p "ERROR: Invalid input. Do you wish to delete this file? (Y or N)" input
    done
    
    if [ "${input^^}" == "Y" ]
    then
      rm ${filename/enc/dec}
      echo "The file was deleted"
    fi
  ;;
  *)
    echo "Invalid Input - Exiting Program ..."
  ;;
esac

echo "============================================="
echo "               End of Program                "
echo "============================================="
