#!/bin/bash 
echo "Enter a new group name: " 
read gname 
grep $gname /etc/group > /dev/null 
while [ $? -eq 0 ] 
do 
  echo "<$gname> group name is already in use. Try another group name." 
  echo "Enter a new group name: " 
  read gname
  grep $gname /etc/group > /dev/null      
done 
sudo groupadd $gname 
echo $?
echo "Enter a new user name: " 
read uname 
grep $uname /etc/passwd > /dev/null 
while [ $? -eq 0 ] 
do 
  echo "<$uname> user name is already in use. Try another user name." 
  echo "Enter a new user name: " 
  read uname
  grep $uname /etc/passwd > /dev/null      
done 
sudo useradd -g $gname -s /bin/bash -md /$uname $uname
echo $?
sudo passwd $uname
echo $?
groups $uname
id $uname
sudo chown $uname:$gname /$uname
echo $?
sudo chmod ug=rwx /$uname
echo $?
sudo chmod o-rwx /$uname
echo $?
sudo chmod +t /$uname/
echo $?