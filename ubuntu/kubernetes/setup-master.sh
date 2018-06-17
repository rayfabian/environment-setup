#Get the IP address
masterIP=`ifconfig eth0 | grep "inet addr" | cut -d ':' -f 2 | cut -d ' ' -f 1`
echo "Master IP address"
echo "${masterIP}"