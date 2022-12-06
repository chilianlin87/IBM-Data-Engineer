coinmon # bitcoin crypto price top 10
coinmon -t 15 #bitcoin crypto price top 15
coinmon -c EUR #bitcoin crypto price top 10 in EUR
coinmon -f btc #find bitcoin price
coinmon -h #bitcoin price help
sudo unrar e -r 1125.rar #unrar, rar, extract rar
paste from clipboard to nano: shift+right mouse
find . -type  f | grep -v "[0-9].txt" | wc -l #count the number of txt files in director and subdirectories, find txt files, count txt files, directory and subdirectory
$? #return the status of last command
wsl --shutdown
wsl -terminate Ubuntu
wsl -t docker-desktop
wsl -t docker-desktop-data

#run a file with function
source file.sh, then you can use the function
$0 - The filename of the current script.|
$n - The Nth argument passed to script was invoked or function was called.|
$# - The number of argument passed to script or function.|
$@ - All arguments passed to script or function.|
$* - All arguments passed to script or function.|
$? - The exit status of the last command executed.|
$$ - The process ID of the current shell. For shell scripts, this is the process ID under which they are executing.|
$! - The process number of the last background command.|

#echo  sequence using braces with input paramater
eval echo {0..$1}
seq 126 | awk '{printf "%c", $0}' | grep -o '[[:digit:]]' #print character class, characters in character class
#cron
using
nano /etc/crontab
instead of 
crontab -e

echo 'hello world!" >> one.txt
cd
pwd
ls -l
mkdir newfolder
touch newfile.txt
wc todo.txt (lines, words, chars)
cat todo.txt
less todo.txt
more todo.txt
head -n text.txt
tail -n text.txt
mv one.txt two.txt (rename or move file)
cp echo-out.txt Desktop (copy)
cp -r Documents Desktop (copy directory)
rm echo-out.txt (delete file)
rm -r Desktop/Documents
ls 2016*
ls *.jpg
ls *01.*
grep "x" states.txt
grep "i.g" states.txt ("." period represents any character)
egrep "s+as" states.txt (+ represents one or more occurences of the preceeding expression)
egrep "s*as" states.txt ("*" represents zero or more occurences of the preceeding expression)
egrep "s{2}" states.txt (curly brackets {} with a number to specify an exact number of occurences of an expression)
egrep "s{2,3}" states.txt ({2,3} mean two or three adjacent occurences )
egrep "(iss){2}" states.txt (()means a group, {} means number of occurrences, here means ississ)
egrep "(i.{2}){3}" states.txt (this one means three occurrences of an "i" followed by two of any character)

touch small.txt
echo "abcdefghijklmnopqrstuvwxyz" >> small.txt
echo "ABCDEFGHIJKLMNOPQRSTUVWXYZ" >> small.txt
echo "0123456789" >> small.txt
echo "aa bb cc" >> small.txt
echo "rhythms" >> small.txt
echo "xyz" >> small.txt
echo "abc" >> small.txt
echo "tragedy + time = humor" >> small.txt
echo "http://www.jhsph.edu/" >> small.txt
echo "#%&-=***=-&%#" >> small.txt

egrep "\w" small.txt #The \w metacharacter corresponds to all “word” characters, the \d metacharacter corresponds to all “number” characters, and the \s metacharacter corresponds to all “space” characters
egrep "\d" small.txt
egrep "\s" small.txt
egrep -v "\w" small.txt #\w matches all letters, numbers, and even underscores(_), -v flag do the opposite
egrep "\W" small.txt #non words
egrep "\D" small.txt #non digits
egrep "\S" small.txt #non spaces
egrep "[aeiou]" small.txt #[]means set of characters, either one of them 
egrep "[^aeiou]" small.txt #matches all characters that are not vowels
egrep "[e-q]" small.txt #all lowercase letters between "e" and "q"
egrep "[E-Q]" small.txt #between E and Q
egrep "[e-qE-Q]" small.txt #ignore case
egreq -i "[e-q]" small.txt #same as above
egrep "\+" small.txt #find + sign
egrep "\." small.txt #find . sign
egrep "^M" states # ^ means beginning first you get the power, then you get the money, $ match the end
egrep "North|South" states.txt # | means or, match either one
egrep "North|South|East|West" states.txt # match either one
egrep -n "t$" states.txt # match states that end with t, also display line number
egrep "New" states.txt canada.txt # grep multiple files at once
egrep "^[AEIOU]{1}.+[aeiou]{1}$" states.txt # starts that start with vowel and also end with vewel.
Metacharacter

Meaning

.

Any Character

\w

A Word

\W

Not a Word

\d

A Digit

\D

Not a Digit

\s

Whitespace

\S

Not Whitespace

[def]

A Set of Characters

[^def]

Negation of Set

[e-q]

A Range of Characters

^

Beginning of String

$

End of String

\n

Newline

+

One or More of Previous

*

Zero or More of Previous

?

Zero or One of Previous

|

Either the Previous or the Following

{6}

Exactly 6 of Previous

{4, 6}

Between 4 and 6 or Previous

{4, }

More than 4 of Previous

find . -name "states.txt" 
find . -name "*.jpg"  #If you want to find the location of a file or the location of a group of files you can use the find command. This command has a specific structure where the first argument is the directory where you want to begin the search, and all directories contained within that directory will also be searched. The first argument is then followed by a flag that describes the method you want to use to search. In this case we’ll only be searching for a file by its name, so we’ll use the -name flag. The -name flag itself then takes an argument, the name of the file that you’re looking for. 

history #The commands that we’ve used since opening our terminal can be accessed via the history command
head -n 5 ~/.bash_history
grep "canada" ~/.bash_history
alias docs='cd ~/Documents'
alias edbp='nano ~/.bash_profile'
source ~/.bash_profile



cd ~/Documents
head -n 4 states.txt > four.txt
head -n 6 states.txt > six.txt
diff four.txt six.txt # difference of two files
sdiff four.txt six.txt # side by side difference

md5sum states.txt

## MD5 (states.txt) = 8d7dd71ff51614e69339b03bd1cb86ac

md5sum states_copy.txt

## MD5 (states_copy.txt) = 8d7dd71ff51614e69339b03bd1cb86ac
shasum states.txt

## 588e9de7ffa97268b2448927df41760abd3369a9  states.txt

shasum states_copy.txt

## 588e9de7ffa97268b2448927df41760abd3369a9  states_copy.txt

sha256sum states.txt

## 588e9de7ffa97268b2448927df41760abd3369a9  states.txt

sha256sum states_copy.txt

## 588e9de7ffa97268b2448927df41760abd3369a9  states_copy.txt

cat canada.txt | head -n 5
grep "[aeiou]$" states.txt | wc -l
ls -al | grep "Feb" | less

#math
expr 1 / 3 #space is needed here
expr 10 / 3
expr 10 % 3 #modulo
echo "22 / 7" | bc -l #do calculation with fractions using bench calculator bc
echo "(6.5 / 0.5) + ( 6 * 2.2)" | bc -l

#variables
chapter_number=5 #space is prohibited
echo $chapter_number
let chapter_number=$chapter_number+1 #modify the value of a variable using let
the_empire_state="New York"
math_lines=$(cat math.sh | wc -l) #$() is called command substitution
echo $math_lines
echo "I went to school in $the_empire_state."

#!/usr/bin/env bash
# File: vars.sh

echo "Script arguments: $@"
echo "First arg: $1. Second arg: $2."
echo "Number of arguments: $#"
bash vars.sh
bash vars.sh red
bash vars.sh red blue
bash vars.sh red blue green

#!/usr/bin/env bash
# File: letsread.sh

echo "Type in a string and then press Enter:"
read response  #user input, this is the variable name
echo "You entered: $response"
#the exit status of last program run
echo $? #true has an exit status of 0 and false has an exit status of 1

#and operator (&&), or operator (||)
true && echo "Program 1 was excuted."
false && echo "program 2 was excuted"
false || echo "program 3 was excuted"

false && true && echo Hello
echo 1 && false && echo 3
echo Athos && echo Porthos && echo Aramis
true || echo "Program 1 was executed."
false || echo "Program 2 was executed."

false || echo 1 || echo 2
echo 3 || false || echo 4
echo Athos || echo Porthos || echo Aramis
echo Athos || echo Porthos && echo Aramis
echo Gaspar && echo Balthasar || echo Melchior
#conditional expression
[[ 4 -gt 3]] #[[ is a command, it require 4 parameters, 4, -gt, 3 and ]], that's why space is needed
[[ 4 > 3 ]]
[[ 4 -gt 3 ]] && echo t || echo f
[[ 3 -gt 4 ]] && echo t || echo f
[[ -e math.sh ]] && echo t || echo f #-e logical flag test whether or not a file exists

number=7
[[ $number -gt 3 ]] && echo t || echo f
[[ $number -gt 10 ]] && echo t || echo f
[[ -e $number ]] && echo t || echo f  # -e flag only test whether or not a file exists, not testing a variable

Logical Flag

Meaning

Usage

-gt

Greater Than

[[ $planets -gt 8 ]]

-ge

Greater Than or Equal To

[[ $votes -ge 270 ]]

-eq

Equal

[[ $fingers -eq 10 ]]

-ne

Not Equal

[[ $pages -ne 0 ]]

-le

Less Than or Equal To

[[ $candles -le 9 ]]

-lt

Less Than

[[ $wives -lt 2 ]]

-e

A File Exists

[[ -e $taxes_2016 ]]

-d

A Directory Exists

[[ -d $photos ]]

-z

Length of String is Zero

[[ -z $name ]]

-n

Length of String is Non-Zero

[[ -n $name ]]

[[ rhythms =~ [aeiou] ]] && echo t || echo f # =~. The regex match operator compares a string to a regular expression and if the string is a match for the regex then the expression is equivalent to true, otherwise it’s equivalent to false
my_name=sean
[[ $my_name =~ ^s.+n$ ]] && echo t || echo f

[[ 7 -gt 2 ]] && echo t || echo f
[[ ! 7 -gt 2 ]] && echo t || echo f # NOT operator !
[[ 6 -ne 3 ]] && echo t || echo f
[[ ! 6 -ne 3 ]] && echo t || echo f
Logical Operator

Meaning

Usage

=~

Matches Regular Expression

[[ $consonants =~ [aeiou] ]]

=

String Equal To

[[ $password = "pegasus" ]]

!=

String Not Equal To

[[ $fruit != "banana" ]]

!

Not

[[ ! "apple" =~ ^b ]]

#!/usr/bin/env bash
# File: simpleif.sh

echo "Start program"

if [[ $1 -eq 4 ]]
then
  echo "You entered $1"
  fi

  echo "End program"

#!/usr/bin/env bash
# File: simpleifelse.sh

echo "Start program"

if [[ $1 -eq 4 ]]
then
  echo "Thanks for entering $1"
  else
    echo "You entered: $1, not what I was looking for."
    fi

    echo "End program"

#!/usr/bin/env bash
# File: simpleelif.sh

if [[ $1 -eq 4 ]]
then
  echo "$1 is my favorite number"
  elif [[ $1 -gt 3 ]]
  then
    echo "$1 is a great number"
    else
      echo "You entered: $1, not what I was looking for."
      fi

#!/usr/bin/env bash
# File: condexif.sh

if [[ $1 -gt 3 ]] && [[ $1 -lt 7 ]]
then
  echo "$1 is between 3 and 7"
  elif [[ $1 =~ "Jeff" ]] || [[ $1 =~ "Roger" ]] || [[ $1 =~ "Brian" ]]
  then
    echo "$1 works in the Data Science Lab"
    else
      echo "You entered: $1, not what I was looking for."
      fi

#!/usr/bin/env bash
# File: nested.sh

if [[ $1 -gt 3 ]] && [[ $1 -lt 7 ]]
then
  if [[ $1 -eq 4 ]]
    then
        echo "four"
          elif [[ $1 -eq 5 ]]
            then
                echo "five"
                  else
                      echo "six"
                        fi
                        else
                          echo "You entered: $1, not what I was looking for."
                          fi

#!/usr/bin/env bash
# File: condexif.sh

if [[ $1 -gt 3 ]] && [[ $1 -lt 7 ]]
then
  echo "$1 is between 3 and 7"
elif [[ $1 =~ "Jeff" ]] || [[ $1 =~ "Roger" ]] || [[ $1 =~ "Brian" ]]
then
  echo "$1 works in the Data Science Lab"
else
  echo "You entered: $1, not what I was looking for."
fi
#arrays
plagues=(blood frogs lice flies sickness boils hail locusts darkness death)
echo ${plagues[0]}
echo ${plagues[*]}
echo ${plagues[*]}
plagues[4]=disease
echo ${plagues[*]}
echo ${plagues[*]:5:3}
echo ${#plagues[*]}
echo ${#plagues[@]}
dwarfs=(grumpy sleepy sneezy doc)
echo ${dwarfs[*]}
dwarfs+=(bashful dopey happy)
echo ${dwarfs[*]}
#braces
echo {0..9}
echo {a..e}
echo {W..Z}
echo a{0..4}
echo b{0..4}c
echo {1..3}{A..C}
start=4
end=9
echo {$start..$end}
eval echo {$start..$end}
echo {{1..3},{a..c}} #You can combine sequences with a comma between brackets ({,})
echo {Who,What,Why,When,How}?

#loops
#!/usr/bin/env bash
# File: forloop.sh

echo "Before Loop"

for i in {1..3}
do
    echo "i is equal to $i"
done

echo "After Loop"
#!/usr/bin/env bash
# File: manyloops.sh

echo "Explicit list:"

for picture in img001.jpg img002.jpg img451.jpg
do
    echo "picture is equal to $picture"
done

echo ""
echo "Array:"

stooges=(curly larry moe)

for stooge in ${stooges[*]}
do
    echo "Current stooge: $stooge"
done

echo ""
echo "Command substitution:"

for code in $(ls)
do
    echo "$code is a bash script"
done

#!/usr/bin/env bash
# File: whileloop.sh

count=3

while [[ $count -gt 0 ]]
do
  echo "count is equal to $count"
  let count=$count-1
done
#!/usr/bin/env bash
# File: foreverloop.sh

count=3

while [[ $count -gt 0 ]]
do
  echo "count is equal to $count"
  let count=$count+1              # We only changed this line!
done
#!/usr/bin/env bash
# File: nestedloops.sh

for number in {1..3}
do
  for letter in a b
  do
    echo "number is $number, letter is $letter"
  done
done
#!/usr/bin/env bash
# File: ifloop.sh

for number in {1..10}
do
  if [[ $number -lt 3 ]] || [[ $number -gt 8 ]]
  then
    echo $number
  fi
done
#writing functions
function [name of function] {
  # code here
}
#!/usr/bin/env bash
# File: hello.sh

function hello {
  echo "Hello"
}
#!/usr/bin/env bash
# File: ntmy.sh

function ntmy {
  echo "Nice to meet you $1"
}
#!/usr/bin/env bash
# File: addseq.sh

function addseq {
  sum=0

  for element in $@
  do
    let sum=sum+$element
  done

  echo $sum
}
source addseq.sh
addseq 3 0 0 7
echo $sum
#!/usr/bin/env bash
# File: addseq2.sh

function addseq2 {
  local sum=0

  for element in $@
  do
    let sum=sum+$element
  done

  echo $sum
}
source addseq.sh
source addseq2.sh
sum=4444
addseq 5 10 15 20
echo $sum
sum=4444
addseq2 5 10 15 20
echo $sum
my_sum=$(addseq2 5 10 15 20)
echo $my_sum
Character

Meaning

u

The owner of the file

g

The group that the file belongs to

o

Everyone else

a

Everyone above
Character

Meaning

+

Add permission

-

Remove permission

=

Set permission
Character

Meaning

r

Read a file

w

Write to or edit a file

x

Execute a file
echo 'echo "a small program"' > short
ls -l short
chmod u+x short
ls -l short
./short
echo '#!/usr/bin/env bash' > short
echo 'echo "a small program"' >> short
echo $HOME
echo $PWD
echo $PATH
mkdir Commands
nano ~/.bash_profile

alias docs='cd ~/Documents'
alias edbp='nano ~/.bash_profile'

export PATH=~/Code/Commands:$PATH
source ~/.bash_profile
short
nano ~/.bash_profile

alias docs='cd ~/Documents'
alias edbp='nano ~/.bash_profile'

export PATH=~/Code/Commands:$PATH
source ~/Code/addseq2.sh
source ~/.bash_profile
addseq2 9 8 7
#git
git --version
git config --global user.name "chilianlin87"
git config --global user.email "chi.lianlin87@gmail.com"
cd
mkdir my-first-repo
cd my-first-repo
git init
echo "Welcome to My First Repo" > readme.txt
git status
git add readme.txt
git status
git rm --cached readme.txt   #how to unstage a file
git status
git add readme.txt
git commit -m "added readme.txt"
git status
touch file1.txt
touch fil2.txt
ls
echo "Learning Git is going well so far." >> readme.txt
git status
git add -A
git status
git commit -m "added two files"
git reset --soft HEAD~   #undo most recent commit
git status
mv fil2.txt file2.txt
git status
git add -A
git status
git commit -m "added two files"
git help status
git log
echo "The third line." >> readme.txt
git diff readme.txt
nano readme.txt
# Delete the second line
git diff readme.txt
git status
cat readme.txt

## Welcome to My First Repo
## I added a line.

git checkout readme.txt
cat readme.txt
touch toby.jpg
git status
echo "*.jpg" > .gitignore
git status
git add -A
git commit -m "added gitignore"
touch bernie.jpg
git status
ls
git branch
git branch my-new-feature
git branch
git checkout my-new-feature
git branch
git status
git checkout master
git branch -d my-new-feature #delete a branch by using the -d flag
git checkout -b update-readme # create a new branch and switch to that branch at the same time using the command git checkout -b flag
echo "I added this line in the update-readme branch." >> readme.txt
cat readme.txt
git add -A
git commit -m "added a third line to readme.txt"
git checkout master
git checkout update-readme
cat readme.txt
echo "It's sunny outside today." >> readme.txt
git add -A
git commit -m "added weather info"
git checkout master
git merge update-readme
git checkout update-readme
nano readme.txt
cat readme.txt
git add -A
git commit -m "changed sunny to cloudy"
git checkout master
nano readme.txt
cat readme.txt
git add -A
git commit -m "changed sunny to windy"
git merge update-readme #conflict needs to be handled manually
git status
cat readme.txt
nano readme.txt
cat readme.txt
git add -A
git commit -m "resolved conflict"
#github
git remote
git remote add origin https://github.com/seankross/my-first-repo.git
git remote
git push -u origin master
#markdown
rm readme.txt
git add -A
git commit -m "added README.md"
git push
Pound signs (#, ##) make headings.

A word surrounded by single asterisks (*word*) makes that word italicized.

A word surrounded by double asterisks (**word**) makes that word bold.

You can create lists with hyphens (-) or numbers (1., 2., 3.).

Code can be placed in the middle of a line with single backticks (`code`).

A code block can be created by putting code in between a set of triple backticks (```).

You can insert a link with brackets and parentheses ([Link text here](http://jhu.edu)).

You can use an image with an exclamation point, and a link to an image (![Alt text here](http://jhu.edu/jeff.jpg))
git checkout update-readme
git merge master
rm *.txt
rm *.jpg
ls
git add -A
git commit -m "made readme more personal"
git push origin update-readme
git checkout master
git pull
git clone https://github.com/[your-github-username]/the-unix-workbench.git
cd the-unix-workbench
echo "- Sean Kross" >> guestbook.md # Add your own name of course!
cat guestbook.md
git add guestbook.md
git commit -m "added my name to guestbook.md"
git push
#nephology
ssh [username]@[IP address]
ssh root@137.184.129.160
ssh root@139.144.61.12
logout
scp [username]@[IP address]:path/to/file/on/server path/on/my/computer
scp -r [username]@[IP address]:path/to/folder/on/server folder/on/my/computer  #-r means entire folder
mkdir Cloud
cd Cloud
scp root@159.203.134.88:/root/textfiles/server-file.txt downloaded.txt
scp path/on/my/computer [username]@[IP address]:path/to/file/on/server 
echo "from local computer" > to-upload.txt
scp to-upload.txt root@159.203.134.88:/root/textfiles/uploaded-file.txt
curl -O http://website.org/textfile.txt
curl -O http://seankross.com/the-unix-workbench/01-What-is-Unix.md
head -n 5 01-What-is-Unix.md
curl https://api.github.com/repos/seankross/the-unix-workbench/languages
{
  "CSS": 2615,
  "TeX": 22
}
curl https://api.github.com/repos/seankross/lego/languages

{
  "R": 4197,
  "Shell": 442
}
curl http://httpbin.org/get

{
  "args": {},
  "headers": {
    "Accept": "*/*",
    "Connection": "close",
    "Host": "httpbin.org",
    "User-Agent": "curl/7.47.0"
  },
  "origin": "159.203.134.88",
  "url": "http://httpbin.org/get"
}
curl http://httpbin.org/get?Baltimore

{
  "args": {
    "Baltimore": ""
  },
  "headers": {
    "Accept": "*/*",
    "Connection": "close",
    "Host": "httpbin.org",
    "User-Agent": "curl/7.47.0"
  },
  "origin": "159.203.134.88",
  "url": "http://httpbin.org/get?Baltimore"
}
curl "http://httpbin.org/get?city=Baltimore&state=Maryland"

{
  "args": {
    "city": "Baltimore",
    "state": "Maryland"
  },
  "headers": {
    "Accept": "*/*",
    "Connection": "close",
    "Host": "httpbin.org",
    "User-Agent": "curl/7.47.0"
  },
  "origin": "159.203.134.88",
  "url": "http://httpbin.org/get?city=Baltimore&state=Maryland"
}
ps -A #list all running programs
ps -A | grep "cron"
select-editor
crontab -e

Minute (m)

Hour (h)

Day of Month (dom)

Month (mon)

Day of Week (dow)

Command to be run (command)
# m h  dom mon dow   command
00 * * * * bash /path/to/script.sh     # Runs every hour at the start of the hour
00 12 * * * bash /path/to/script.sh    # Runs every day at noon
* 12 * * * bash /path/to/script.sh     # Runs every minute between 12pm and 12:59pm
00 00 05 * * bash /path/to/script.sh   # Runs the 5th day of every month at midnight
00 00 * 07 * bash /path/to/script.sh   # Runs every day in the month of July at midnight
00 00 * * 2 bash /path/to/script.sh    # Runs every Tuesday at midnight
# m h  dom mon dow   command
00-04 * * * * bash /path/to/script.sh       # Runs every minute for the first five minutes of every hour
00 00 * * 0,6 bash /path/to/script.sh       # Runs at midnight every Saturday and Sunday
00 03 01-15 * * bash /path/to/script.sh     # Runs at 3am for the first fifteen days of every month 
00,30 * * * * bash /path/to/script.sh       # Runs at the start and middle of every hour
00 00,12 * * * bash /path/to/script.sh      # Runs every day at midnight and noon
00 * 01-07 01,06 * bash /path/to/script.sh  # Runs at the start of every hour for the first seven days of the months of January and June
#shutting down a server
destrop or delete, until you see create new droplet or node

#hands on introduction to linux commands and shell scripting
sudo apt upgrade nano
sudo apt install vim
python3 myprogram.py
whoami #display the name of the current user
uname #basic information about the operating system
uname -a
id #Obtain the user and group identity information
df #display available disk space
df -h #human readable
ps
ps -e
top #The top command provides a dynamic, real-time view of your system.
top -n 10
You can press the following keys while top is running to sort the table:

Key	Sorts by
M	Memory Usage
P	CPU Usage
N	Process ID (PID)
T	Running Time.
echo -e "This will be\tprinted \nin two lines" # \n start a new line, \t insert a tab
date
date "+%D" #mm/dd/yy format
date "+%"
%d	Display the day of the month (01 to 31)
%h	Displays the abbreviated month name (Jan to Dec)
%m	Displays the month of year (01 to 12)
%Y	Displays the four-digit year
%T	Displays the time in 24 hour format as HH:MM:SS
%H	Displays the hour
man date
ls /bin/*r #list all files ending in r in the /bin directory
ls -l
-a	list all files, including hidden files
-d	list directories only, do not include files
-h	with -l and -s, print sizes like 1K, 234M, 2G
-l	include attributes like permissions, owner, size, and last-modified date
-S	sort by file size, largest first
-t	sort by last-modified date, newest first
-r	reverse the sort order
ls -la /etc #to get a long listing of all files in /etc, including any hidden files, enter
find /etc -name '*.txt' 
chmod -r usdoi.txt
cat
more
head
tail
wc -l usdoi.txt
sort usdoi.txt
uniq zoo.txt
grep people usdoi.txt
-n	Along with the matching lines, also print the line numbers
-c	Get the count of matching lines
-i	Ignore the case of the text while matching
-v	Print all lines which do not contain the pattern
-w	Match only if the pattern matches whole words
grep -v login /etc/passwd
cut #The cut command allows you to view the lines of a file after a filter is applied to each line. For example, you can use cut with the -c option to view the first two characters of each line:
cut -c -2 zoo.txt #view only first two characters
cut -c 2- zoo.txt #view each line starting from second character
paste #The paste command allows you to view multiple files at once - with lines being aligned as columns. You can see what that looks like by entering:
paster zoo.txt zoo_ages.txt
paste -d "," zoo.txt zoo_ages.txt # You can also customize the delimiter. 
tar #The tar command allows you to pack multiple files and directories into a single archive file
-c	Create new archive file
-v	Verbosely list files processed
-f	Archive file name
tar -cvf bin.tar /bin
To see the list of files in the archive, use the -t option:

tar -tvf bin.tar
To untar the archive or extract files from the archive, use the -x option:

tar -xvf bin.tar
zip

The zip command allows you to compress files.

The following command creates a zip file named config.zip consisting of all the files with extension .conf in the /etc directory.

zip config.zip /etc/*.conf
The -r option can be used to zip an entire directory.

The following command creates an archive of the /bin directory.

zip -r bin.zip /bin
unzip

The following command lists the files of the archive called config.zip

unzip -l config.zip
The following command extracts all the files in the archive bin.zip.

unzip -o bin.zip
We added the -o option to force overwrite, in case you run the command more than once.

You should see a folder named bin created in your directory.
hostname

To view the current host name, run the command below .

hostname
You can use the -i option to view the IP adrress of the host:

hostname -i
4.2. Test if a host is reachable

ping

Check if www.google.com is reachable. The command keeps sending data packets to the www.google.com server and prints the response it gets back. (Press Ctrl+C to stop pinging)

ping www.google.com
If you want to ping only for a limited number of times, use -c option.

ping -c 5 www.google.com
4.3. Display network interface configuration

ifconfig

The ifconfig command is used to configure or display network interface parameters for a network.

To display the configuration of all network interfaces of the system, enter:

ifconfig
To display the configuration of an ethernet adapter eth0, enter:

ifconfig eth0
eth0 is usually the primary network interface that connects your server to the network.

You can see your server's IP address in line number 2 after the word inet.

4.4. Transfer data from or to a server

curl

You can use curl to access the file at the following URL and display the file's contents on your screen:

curl https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/usdoi.txt
or to access the file at the given URL and save it in your current working directory:

curl -O https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/usdoi.txt

4.5. Downloading file(s) from a URL

wget

The wget command is similar to curl - however it's primary use is for file downloading. One unique feature of wget is that it can recursively download files at a URL.

To see how wget works, first remove usdoi.txt from your current directory:

rm usdoi.txt
and re-download it using wget as follows:

wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/usdoi.txt
Some commands, such as tr, only accept "standard input" as input (not strings or filenames):
#tr translate, replace

tr (translate) - replaces characters in input text.
Syntax: tr [OPTIONS] [target characters] [replacement characters]
In cases like this, we can use piping to apply the command to strings and file contents.

With strings, you could, for example, use echo in combination with tr to replace all vowels in a string with underscores, as follows:

$ echo "Linux and shell scripting are awesome\!" | tr "aeiou" "_"
L_n_x _nd sh_ll scr_pt_ng _r_ _w_s_m_!
To perform the complement of the operation from the previous example, that is, to replace all consonants with an underscore, you can use the -c option like this:

$ echo "Linux and shell scripting are awesome\!" | tr -c "aeiou" "_"
_i_u__a_____e______i__i___a_e_a_e_o_e_
With files, you could use cat in combination with tr to change all of the text to upper case as follows:

$ cat pets.txt | tr "[a-z]" "[A-Z]"
GOLDFISH
DOG
CAT
PARROT
DOG
#GOLDFISH
GOLDFISH
The possibilities are endless! For example:

$ sort pets.txt | uniq | tr "[a-z]" "[A-Z]"
CAT
DOG
GOLDFISH
PARROT


Entering the following command returns the BTC price data, displayed as a json object:

$ curl -s --location --request GET https://api.coinstats.app/public/v1/coins/bitcoin\?currency\=USD #this can't run in ubuntu, only run in windows
{
  "coin": {
    "id": "bitcoin",
    "icon": "https://static.coinstats.app/coins/Bitcoin6l39t.png",
    "name": "Bitcoin",
    "symbol": "BTC",
    "rank": 1,
    "price": 57907.78008618953,
    "priceBtc": 1,
    "volume": 48430621052.9856,
    "marketCap": 1093175428640.1146,
    "availableSupply": 18877868,
    "totalSupply": 21000000,
    "priceChange1h": -0.19,
    "priceChange1d": -0.4,
    "priceChange1w": -9.36,
    "websiteUrl": "http://www.bitcoin.org",
    "twitterUrl": "https://twitter.com/bitcoin",
    "exp": [
      "https://blockchair.com/bitcoin/",
      "https://btc.com/",
      "https://btc.tokenview.com/"
    ]
  }
}
(The output is formatted for your convenience in this lab).

The json field you want to grab here is "price": [numbers].[numbers]". To grab this you can use the following grep command to extract it from the json text:

grep -oE "\"price\"\s*:\s*[0-9]*?\.[0-9]*"

Let's break down the details of this statement:

-o tells grep to only return the matching portion
-E tells grep to be able to use extended regex symbols such as ?
\"price\" matches the string "price"
\s* matches any number (including 0) of whitespace (\s) characters
: matches :
[0-9]* matches any number of digits (from 0 to 9)
?\. optionally matches a . (this is in case price were an integer)
Now that you have the grep statement that you need, you can pipe the BTC data to it using the curl command from above:

$ curl -s --location --request GET https://api.coinstats.app/public/v1/coins/bitcoin\?currency\=USD |\
    grep -oE "\"price\":\s*[0-9]*?\.[0-9]*"
"price": 57907.78008618953
The backslash \ character used here after the pipe | allows you to write the expression on multiple lines.

Finally, to get only the value in the price field, and drop the "price" label, you can use chaining to pipe the same output to another grep:

$ curl -s --location --request GET https://api.coinstats.app/public/v1/coins/bitcoin\?currency\=USD |\
    grep -oE "\"price\":\s*[0-9]*?\.[0-9]*" |\
    grep -oE "[0-9]*?\.[0-9]*"
57907.78008618953

1.1 '#' - For adding comments

Lines beginning with a # (with the exception of #!) are comments and will not be executed.

# This is a comment line
1.2 ';' - Command seperator

Multiple commands can be seperated from each other using a ; when used in a single command line.

pwd;date
1.3 * - wildcard used in filename expansion

The '*' character matches any number of any character in filename patterns. By itself, it matches every filename in a given directory.

The following example lists all files whose name ends with a '.conf' in the /etc directory.

ls /etc/*.conf
1.4 '?' - wildcard used in filename expansion

The '?' character represents a single character in a filename pattern.

The following command lists all files whose name starts with any single character followed by 'grep'.

ls /bin/?grep
Exercise 2 - Quoting
If any special character has to be treated without their special meaning, we need to quote them.

The following examples show how quoting is done in shell.

2.1 Quoting using backslash (\)

Backslash removes the meaning of the special character that follows it.

echo The symbol for multiplicaton is \*
2.2 Quoting using single quote (')

A pair of single quotes removes special meanings of all special characters within them (except another single quote).

echo 'Following are some special characters in shell - < > ; " ( ) \ [ ]  '
2.3 Quoting using double quote (")

A pair of double quotes removes special meanings of all special characters within them except another double quote, variable substitution and command substitution..

Try out the examples below with double quotes as well as single quotes to see the difference between their usage.

echo "Current user name: $USERNAME"
echo 'Current user name: $USERNAME'
Exercise 3 - Working with variables
About Variables

Variables help store data for the script. The data may be in the form of a number or a character string.

You may create, remove or display the variables.

Let us now see how they are used in the shell.

3.1 List the variables already defined in the shell.

set
You should see a lot of variables in the output.

3.2 Create new variables

Use the syntax variable_name=value.

Create a new variable called 'balance' with a value of 10000. List all the variables again.

balance=10000
Run the set command to check if the variable balance has been created.

set
3.3 Create an environment variable

Environment variables are just like any other variable. They differ in the fact that they are copied to any child process created from the shell.

export command can be used to convert a regular variable to environment variable.

Make the variable ' balance' an environment variable.

export balance
3.4 List environment variables

Use the following command to list all the environment variables.

env
You should see a lot of variables in the output.

3.5 Display the value of a variable

To display or interpolate the value of a variable in a command, we use the feature of shell called variable substitution.

It is done by preceding the name of the variable with a $ (dollar) symbol.

The command below prints the value of the variable $balance.

echo "Current account balance is $balance"
3.6 Remove a variable

To remove variables, use unset command.

Remove variable 'balance'.

unset balance
Run the set command to check if the variable balance has been removed.

set
Exercise 4 - Command substitution
Command substitution is a feature of the shell, which helps save the output generated by a command in a variable.

It can also be used to nest multiple commands , so that the innermost command's output can be used by outer commands.
The inner command is enclosed in $() and will execute first.

Let us try the following examples.

**4.1 Store the output of the command hostname -i in a variable named $myip

myip=$(hostname -i)
echo $myip
4.2 Print the following message on screen:

"Running on host : host_name" ,

Where 'host_name' should be your current hostname.

echo "Running on host: $(hostname)"
Command substitution can be done using the backquote syntax also.

ls -l `which cat`
The output of command which cat is the path to the command cat. This path is sent to ls -l as an input. You should see the permissions for the file cat in the output.

Exercise 5 - I/O Redirection
Linux sends the output of a command to standard output (display) and any error generated is sent to standard error (display).

Similarly, the input required by a command is received from standard input (keyboard).

If we need to change these defaults, shell provides a feature called I/O Redirection.

This is achieved using the following special characters.

Symbol	Meaning
<	Input Redirection
>	Output Redirecton
>>	Append Output
2>	Error Redirection
Let us try a few examples.

5.1 Save the network configuration details into a file called output.txt

In this example, we will send the output of ifconfig command to the file instead of standard output(display).

ifconfig > output.txt
Check out the contents of output.txt

cat output.txt
5.2 Save the output of date command into the file 'output.txt'.

date > output.txt
Check out the contents of output.txt

cat output.txt
Did you notice, that previous contents of output.txt were overwritten?

When you redirect using > the contents of the target file are overwritten.

5.3 Append output to a file

Now, we will try the following sequence, where we use '>>' instead of '>'.

Run the commands below.

uname -a >> newoutput.txt
date >> newoutput.txt
Check out the contents of newoutput.txt

cat newoutput.txt
You should see the output of uname and date commands appended to the file newoutput.txt

5.4 Dipslay the contents of file 'newoutput.txt' in all uppercase.

You can use the command tr for this translation.

tr command does not accept file names as arguments. But it accepts standard input.

So, we will redirect the content of file 'newoutput.txt' to the input of tr command.

tr "[a-z]" "[A-Z]" < newoutput.txt
You should see all capital letters in the output.

crontab -r
crontab -l

Linux and Bash Command Cheat Sheet: The Basics
Getting information
# return your user name
whoami

# return your user and group id
id

# return operating system name, username, and other info
uname -a

# display reference manual for a command
man top

# get help on a command
curl --help

# return the current date and time
date

Monitoring performance and status
# list selection of or all running processes and their PIDs
ps
ps -e

# display resource usage
top

# list mounted file systems and usage
df

Working with files
# copy a file
cp file.txt new_path/new_name.txt

# change file name or path
mv this_file.txt that_path/that_file.txt

# remove a file verbosely
rm this_old_file.txt -v

# create an empty file, or update existing file's timestamp
touch a_new_file.txt

# change/modify file permissions to 'execute' for all users
chmod +x my_script.sh

# get count of lines, words, or characters in file
wc -l table_of_data.csv
wc -w my_essay.txt
wc -m some_document.txt

# return lines matching a pattern from files matching a filename pattern - case insensitive and whole words only
grep -iw hello \*.txt

# return file names with lines matching the pattern 'hello' from files matching a filename pattern
grep -l hello \*.txt

Navigating and working with directories
# list files and directories by date, newest last
ls -lrt

# find files in directory tree with suffix 'sh'
find -name '\*.sh'

# return present working directory
pwd

# make a new directory
mkdir new_folder

# change the current directory: up one level, home, or some other path
cd ../
cd ~ or cd
cd another_directory

# remove directory, verbosely
rmdir temp_directory -v

Printing file and string contents
# print file contents
cat my_shell_script.sh

# print file contents page-by-page
more ReadMe.txt

# print first N lines of file
head -10 data_table.csv

# print last N lines of file
tail -10 data_table.csv

# print string or variable value
echo "I am not a robot"
echo "I am $USERNAME"

Compression and archiving
# archive a set of files
tar -cvf my_archive.tar.gz file1 file2 file3

# compress a set of files
zip my_zipped_files.zip file1 file2
zip my_zipped_folders.zip directory1 directory2

# extract files from a compressed zip archive
unzip my_zipped_file.zip
unzip my_zipped_file.zip -d extract_to_this_direcory

Performing network operations
# print hostname
hostname

# send packets to URL and print response
ping www.google.com

# display or configure system network interfaces
ifconfig
ip

# display contents of file at a URL
curl <url>

# download file from a URL
wget <url>

Bash shebang
#!/bin/bash

Pipes and Filters
# chain filter commands using the pipe operator
ls | sort -r

# pipe the output of manual page for ls to head to display the first 20 lines
man ls | head -20

Shell and Environment Variables
# list all shell variables
set

# define a shell variable called my_planet and assign value Earth to it
my_planet=Earth

# display shell variable
echo $my_planet

# list all environment variables
env

# environment vars: define/extend variable scope to child processes
export my_planet
export my_galaxy='Milky Way'

Metacharacters
# comments
# The shell will not respond to this message

# command separator
echo 'here are some files and folders'; ls

# file name expansion wildcard
ls *.json

# single character wildcard
ls file_2021-06-??.json

Quoting
# single quotes - interpret literally
echo 'My home directory can be accessed by entering: echo $HOME'

# double quotes - interpret literally, but evaluate metacharacters
echo "My home directory is $HOME"

# backslash - escape metacharacter interpretation
echo "This dollar sign should render: \$"

I/O Redirection
# redirect output to file
echo 'Write this text to file x' > x

# append output to file
echo 'Add this line to file x' >> x

# redirect standard error to file
bad_command_1 2> error.log

# append standard error to file
bad_command_2 2>> error.log

# redirect file contents to standard input
$ tr “[a-z]” “[A-Z]” < a_text_file.txt

# the input redirection above is equivalent to
$cat a_text_file.txt | tr “[a-z]” “[A-Z]”

Command Substitution
# capture output of a command and echo its value
THE_PRESENT=$(date)
echo "There is no time like $THE_PRESENT"

Command line arguments
./My_Bash_Script.sh arg1 arg2 arg3

Batch vs. concurrent modes
# run commands sequentially
start=$(date); ./MyBigScript.sh ; end=$(date)

# run commands in parallel
./ETL_chunk_one_on_these_nodes.sh & ./ETL_chunk_two_on_those_nodes.sh

Scheduling jobs with Cron
# open crontab editor
crontab -e

# job scheduling syntax
m h dom mon dow command
minute, hour, day of month, month, day of week
* means any

# append the date/time to file every Sunday at 6:15 pm
15 18 * * 0 date >> sundays.txt

# run a shell script on the first minute of the first day of each month
1 0 1 * * ./My_Shell_Script.sh

# back up your home directory every Monday at 3 am
0 3 * * 1 tar -cvf my_backup_path\my_archive.tar.gz $HOME\

# deploy your cron job
Close the crontab editor and save the file

# list all cron jobs
crontab -l

If
Syntax:

if [ condition ]
then
    statement
fi
You must always put spaces around your conditions in the [ ].

Every if condition block must be paired with a fi.

Example
$ cat if_example.sh
a=1
b=2
if [ $a -lt $b ]
then
    echo "a is less than b"
fi

$ sh if_example.sh  # sh tells the terminal to run the script if_example.sh using the default shell
a is less than b
If-Else
Syntax:

if [ condition ]
then
    statement_1  
else
    statement_2  
fi
You don't use then for else cases.

Example
$ cat if_else_example.sh
a=3
b=2
if [ $a -lt $b ]
then
    echo "a is less than b"
else
    echo "a is greater than or equal to b"
fi

$ sh if_else_example.sh
a is greater than or equal to b
Elif
The statement elif means "else if":

Syntax:

if [ condition_1 ] 
then
    statement_1 
elif [ condition_2 ]  
then
    statement_2  
fi
Example
$ cat elif_example.sh
a=2
b=2
if [ $a -lt $b ]
then
    echo "a is less than b"
elif [ $a == $b ]
then
    echo "a is equal to b"
else # Here a is not <= b, so a > b
    echo "a is greater than b"
fi

$ sh elif_example.sh
a is equal to b
Nested Ifs
As in other prgramming languages, it's also possible to nest if-statements.

Syntax:

if [ condition_1 ]  
then  
    statement_1  
elif [ condition_2 ] 
    statement_2
    if [ condition_2.1 ]
    then
        statement_2.1
    fi
else
    statement_3
fi
Example
$ cat nested_ifs_example.sh
a=3
b=3
c=3
if [ $a == $b ]
then
    if [ $a == $c ]
    then
        if [ $b == $c ]
        then
            echo "a, b, and c are equal"
        fi
    fi
else
    echo "the three variables are not equal"
fi

$ sh nested_ifs_example.sh
a, b, and c are equal
Alternatively, this example could have been simplified to a single if-statement:

a=3
b=3
c=3
if [ $a == $b ] && [ $a == $c ] && [ $b == $c ]
then
    echo "a, b, and c are equal"
else
    echo "the three variables are not equal"
fi
&& means "and"

Bonus: "test"
Sometimes, instead of using brackets around conditions, you'll see the test command in use:

Example
$ cat test_example.sh
a=1
b=2
if test $a -lt $b
then
    echo "a is less than b"
fi

$ sh test_example.sh
a is less than b
test and [ ] are the same command. We encourage using [ ] instead as it's more readable.

wsl --list --verbose #how to check wsl version, in powershell type this command
lsb_release -a #how to check ubuntu version, in bash or ubuntu type this command

$0 - The filename of the current script.|
$n - The Nth argument passed to script was invoked or function was called.|
$# - The number of argument passed to script or function.|
$@ - All arguments passed to script or function.|
$* - All arguments passed to script or function.|
$? - The exit status of the last command executed.|
$$ - The process ID of the current shell. For shell scripts, this is the process ID under which they are executing.|
$! - The process number of the last background command.|

[Environment]::OSVersion #check windows version in powershell

wsl --set-default-version 2 #set wsl 2 as your default version when installing new linux distributions

docker pull centos
docker run -d -t --name lennycentos centos
docker ps
docker exec -it lennycentos bash
docker pull alpine
docker run -t -d --name lennyalpine alpine
docker ps
docker exec -it lennyalpine sh
docker pull ubuntu
docker run -t -d --name lennyubuntu ubuntu
docker ps
docker exec -it lennyubuntu bash
docker exec -it ooxwv-docker_hadoop bash






