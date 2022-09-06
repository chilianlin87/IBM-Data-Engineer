paste from clipboard to nano: shift+right mouse
#return the status of last command
$?
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



