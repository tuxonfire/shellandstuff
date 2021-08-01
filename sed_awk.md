# Linux Admin with sed and awk

1. Grep
2. Regular Expressions
3. seed and awk
4. a better lastlog
5. extract XML Data
6. Sumarize Logs

# GREP 
### Global Regular Expression and Print
### For text search utility used from linux command line to globally search file ir stdin 
### for a given regular expression. It will print matching lines to stdout

## Random grep

-c indicate the count the currencies rather than display them.

grep -c name /proc/cpuinfo    # counts number of cpu in a host -c indicate the count instead show.
ifconfig wlp2s0 | grep RX     # display transmission data
ifconfig wlp2s0 | grep -i rx  # -i look for mayus or minus
 cat !$                       # see last output ***investigate*** 
grep pam_nologin /etc/pam.d

# Parsing 
 (./parsecsv script and tools file are located in this same directory)
 ./parsecsv tools | grep -A2 hammer
 
 grep -i blabla # -i Case sensitive

 create tools file with the entries of the tools file:
 hammer,90,1

 -A  specifies how many lines after the match to we want to include.
-NUM  
 ./parsecsv tools | grep -A2 hammer   # --after-context =NUM A2
 ./parsecsv tools | grep -B2 hammer   # --before-context =NUM B2
 ./parsecsv tools | grep -C2 hammer   # --contex =NUM 





For instance:
This means ^ before GREP the search has to begin with word user:

 grep ^user /etc/passwd

#### Note:is good idea put single quotes at the beggining of a regular expression
to make sure that we dont misinterpret any characters:
lines begins with any lowe case or underscore:

 declare -f | grep '^[a-z_]'
markdown




## SED
edit files

for example:
sed 'p' /etc/passwd  

with 'p' is going to match; with each line twice:
1. the match
2. the stdout

-n to suppress the stdout,restricting what we display
indicating the number of lines to print in the file:

sed -n ' 1,15 p' /etc/ntp.conf   

The following expressions, look for the lines commented: and deletes it:  /^#/ d with ; we add another filter that deletes lines that begin with the end of the line marker /^$/ d 
sed ' /^#/ d ; /^$/ d' /etc/ntp.conf

With the above commands, the file havent changed, if we
want to change it deleting the comment lines and the
spaces in lines, adding the following:

sed -i.bkpel 
sudo sed -i.back ' /^#/ d ; /^$/ d' /etc/ntp.conf

both files exists, ntp.conf.back is the original file.


## AWK
$0 represents whole line
NR number of rows?

awk ' BEGIN { print "ntp.conf with AWK"}  {print NR, $0 } END { print NR }' /etc/ntp.conf

ifconfig virbr0 | awk -F":" '/inet/{print $3 $4 $5 $6 $7}'  # print eth or virbr0 interface with innet match


ifconfig virbr0 | awk -F":" '{print $1 $2 $3 $4 $5 $6 $7}'  # print eth or virbr0 interface.
OR
ifconfig virbr0 | awk -F":" '{print $0}'
