#!/bin/bash

if [ $# -ne 1 ]
then
     echo "Give some input"
     exit 1
fi

username=`id -u -n`
passwdfile="/home/$username/.ssh/remotehosts"


display()
{
	i=0
        echo "The number of host present in your database"
	while read line
	do 
            HOST=`echo $line | cut -f1 -d:`
	    echo $((++i)):$HOST
   	done < $passwdfile	

}


if [ $1 == "-d" ]
then
     display
     exit 1
fi


login()
{
	i=0
 	while read line
	do
	#	i=$((++i))
        	if [[ $((1)) -eq $((++i)) ]]
		then
		HOST=`echo $line | cut -f1 -d:`
		USER=`echo $line | cut -f2 -d:`
		PASS=`echo $line | cut -f3 -d: |base64 -d`
		fi
	
	done < $passwdfile
#	expect -f "spawn ssh $USER@$HOST;expect 'password: ';send '$PASS';interact '$ '"
	./easy_login_expect.sh $USER $HOST $PASS
        #expect -c "expect eof"

}

login
