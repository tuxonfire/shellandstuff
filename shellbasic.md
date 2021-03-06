################
#   MY PATH    #
#    config    #
################

~~~
~/coudlbeafile.txt
~/myscript.sh
~/home/user
p example:
mkdir bin in /home/user
mv myscript.sh /home/user/bin
PATH=$PATH:~/bin   or PATH="$PATH:~/bin" 
run myscript.sh in any place
~~~

######################
# Variables examples #
######################
myvar="Hola"
echo $myvar

**create a file in a var**

filename="myfile.txt"
touch $filename
ls $filename

**create some files**

files="file1 file2 file3"
touch $files
Three files will be created with touch command sending the three variables
***
grouping variables:
greeting="Hola"
usergreetings="$greeting, $USER"  #values contraining space: use quotes

*******
# read with variables in bash:
******
~~~
#!/bin/bash -x   
#Adding -x is for debugging
#simple note taking script
#Author: ijaimes

#defining topic var
topic=$1

#get the date
date=$(date)

#Ask user for input
read -p "Your input" mynote

#Dealing with variables
#with ${} we get the variable mixed with the other word
echo $date: $mynote >> ${topic}mynotes.txt   
#scaping vars, single quotes escape every single character between them
#scape the quotes themselfs
echo Note \'$mynote\'
~~~

###################
# USING Variables  #
# Best practices   #
# Reading input    #
###################
#Best practices
-Use lowercase names
Good habit:
surround variables with quotes:
 1. Use "$X" instead $X
 2. Prevent surprises when it contain spaces
 3. Use double quotes: keep meaning of dollar sign intact

Braces
1. Where does your variable end?
2. echo "${foo}var"
3. prints value of var "foo" followed by var:
   echo "$foobar" prints value of "foobar"
4. Using braces a lot is a good habit

Another good habit:
1. Use $HOME instead of ~ (could have bash issues with unexpected results)

#################
# Reading input #
#################
read:
 1. Reads a line of input into a variable 
 read var 
 p.example:
 read -p "Type your name:" name


############
Debug in bash
#############
1. Can be added in the shebang line:
#!/bin/bash -x 
2. Can be set as follows in the shell script
set -x  #enable debug
set +x  #disable debug 

i.e:
~~~
set -x
#defining topic var
topic="$1"
set +x
~~~

########################
# Using:               #
# If, Then, else       #
# Return Codes         #
# Conditional expresion#
########################

**************
*IF statement*
**************
help to test if a command success
whether a command succeeds and Then
react to that:
e.i:
~~~
if mkdir testmkdir; then echo "Ok creating directory"; else "error creating directory"; fi
#if statement
if testcode; then
   #Code here gets executed
   #When testcode succeeds
fi
#if statement and else statement
if testcode; then
   #Code here gets executed
   #When testcode succeeds
else
   #Code here gets executed
   #When testcode fails
fi
#if statement in the command line, note the semicolon ";"
if testcode; then successcode; else failecode; fi
~~~

################
#RETURN CODES  #
################
Return code or exit status:
-value returned by a program upon exit
-0...255
0 means SUCCESS 
 -other values are error codes
Shell scripts return values with exit:
 - exit 0
Good habit: Make sure your program exists with a correct value
 - always call exit with a value
If statement just looks at return code for "testcode"
 and determines if then or else parts gets executed.

###############
#Conditionals #
#Expressions  #
###############
-Tests on files and directories
-Tests on strings
-Arithmetic Tests

************
[[ Expression ]]

Expression                  True IF
[[ $str ]]              |  str is not empty
[[ $str ="something" ]] |  str equals string "something" #Note the space between $str and = , two different arguments  
[[ $str="something" ]]  |  Always return TRUE            #Note that there is not a space, that means that Expression thinks that is only one argument, and it always  return true
[[ -e $filename ]]      |  file $filename exists         # -e option to check if the filename variable holds the name of an existing file
[[ -d $dirname ]]       |  $dirname is a directory       # -d option to check if the filename variable holds the name of an existing dir

#Spaces around the expression are very important (Expression thinks that is only one argument if spaces are absent)
#Same for switches (-e and -d ) and equals sign

****
The conditional expresion
****
see creating_script shell

-Classical command: "test"
also: [    use single better than [ instead [[
   but
Is harder to use, easy to make mistakes
Only use for portability

- [[ ... ]] is a bash extension
  Not a command but special syntax, that everything goes between the brackets get parsed in a special way
  Not quotes needed around variables
  Gppd habit: use [[..]] instead of [..]
-GETTING HELP
 help test will show most important info
 help [[ will tell you about the extension.

#######################
# Arithmetic Tests    
# Test numbers    
 ######################

 -For comparing integers only bash does not handle floating
 - [[ arg1 OP arg2 ]]
 - Where OP is:
   -eq: equality  (two numbers are equal)
   -ne: not equal  
   -lt: less than 
   -gt: greater than
 And some others... see help
 DONT USE =,>,< FOR NUMBERS! due to this operators only work with STRINGS only! they look
 for the alphabetical number.

 -Special Variables
  $# contains numbers of script arguments
  #? contains exit status for last command

-To get the lenght of the string in a variable: 
 Use ${#var}
 ************************
 complete with 
 IF STATEMENT: NESTED IF,ELIF,and multiples ELIF...
 AND &&
 OR ||
 NOT !
 ***********************
#################
INPUT AND OUTPUT
#################
**************
printf & echo
**************
~~~
echo "Hola Itzel"
Hola Itzel
~$ printf "Hola"
~$ printf "Hola Itzel"
Hola Itzelitzel@localhost:~$ printf "Hola Itzel\n" #salto de linea
Hola Itzel
itzel@localhost:~$ printf "Hola %s como estas\n" $USER
Hola itzel como estas
~~~

%s #some string

~~~
itzel@localhost:~$ printf "p%st\n" a e i o u
pat
pet
pit
pot
put
itzel@localhost:~$ printf "p%ss home is %s\n" $USER $HOME
pitzels home is /home/itzel
itzel@localhost:~$ printf "%s home is %s\n" $USER $HOME
itzel home is /home/itzel
itzel@localhost:~$ printf "%ss home is %s\n" $USER $HOME #More than 1 string value
itzels home is /home/itzel

printf "|%20s |%20s |%20s |\n" $(ls)
printf "| %30s | %30s | %30s |\n" $(ls)
~~~
... completar mis notes

**************
Standar Streams
**************
~~~
input 0 /dev/stdin
output 1 /dev/stdout
error 2 /dev/stderr
/dev/null /discards all data sent to it
~~~


###############################
#     Control Flow            #
##############################

## Loops ##
#while/until
#for
~~~
for instance:
for i in {itzel,pedro,peter,gorgo}; do adduser $i ; done;
~~~


Break and continue
case
compound commands
|| and &&

# command line arg i.e$ cat myscript $0 is the script itself
~~~
#!/bin/sh
echo "First arg: $1"
echo "Second arg: $2"
$ sh script.sh hello world
First arg: hello
Second arg: world
~~~
