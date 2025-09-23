# Encryption_and_Decryption_Tool

A text message encryption and decryption program to protect data from unauthorized access, which was a standalone project on LinkedIn Learning. The two main outcomes I aim to achieve throughout this project are improving my Bash scripting and encryption skills.

## Description 

As stated in the project brief, I needed to develop a bash-based encryption tool that implements a password with AES-256-cbc encryption used in the terminal. I imagined myself as a cybersecurity analyst at a tech company tasked with planning a realistic approach to this project. The encryption tool must be both simple and effective, supporting secure data handling across internal systems while being easily understood and utilized by employees. 
Using the scenario that I am a cybersecurity analyst at a tech company tasked with this project, it's obvious that the whole company’s internal system is at risk. Without data encryption in the internal system, it is vulnerable to data exfiltration from malware attacks, such as viruses and ransomware. Employee communications are exposed to phishing and man-in-the-middle attacks because they are not secured from the internet and threat actors. If there were a data leak or breach, the company would suffer severe financial loss and damage to its reputation among users.

## Getting Started

### Prerequisites

* Linux environment - preferably Kali Linux virtual machine (VirtualBox or VMware)
* Basic Linux skills (navigation and installing/managing packages)
* Bash scripting skills
* Familiarity with running scripts and managing files in a Linux environment

### Installing

* Download file on GitHub
* Clone repository
* Fork the repository

### Executing Program

* Open the terminal and in the root directory, run the command to allow execute permission:
```
chmod +x ./secureEncryptionTool.sh
```
* To execute the program, run the command:
```
./secureEncryptionTool.sh
```

## Author

Aide Cuevas (LinkedIn in profile)

## Version History

* 0.3
    * Added the option for users to delete the decryption output file for security purposes
    * Added password strength check to combat brute force guessing; must be 8 characters and have at least one uppercase letter, lowercase letter, number, and special character
    * Users' passwords are hidden in the terminal for security purposes
      
*  0.2
    * Added null error-checking feature to all user input prompts
    * Added an override file feature during encryption; if the file name already exists, ask the user if they want to override the file or use a different file name
    * Added a verify encrypted file feature during decryption; if the file the user wants to decrypt doesn't exist, display error message and ask for the correct file name
    * Added decryption password error checking feature; only displays the decrypted message if the password was correct
    * Decryption password error checking feature: Used a while loop to check if the first line of the output file was "bad decrypt", which would display an error message and prompt for the correct password
    * Used the unset command on message and password variables after the openssl commands to remove the sensitive information from shell memory

* 0.1
    * Prompts that asked the user for respective details for encryption or decryption, like the filename and the password
    * No form of null or incorrect input error checking for user responses
    * Sensitive information, such as the plain text message and password, was stored in their respective variables in the current shell's environment

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
