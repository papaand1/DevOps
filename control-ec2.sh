#!/bin/bash


if [ $1 = stop ]; then
echo $1
	#ansible host 1
	#host1=`aws ec2 describe-instance-status --instance-ids i-06f870fdfed572b98 |  grep -w running`
	aws ec2 describe-instance-status --instance-ids i-06f870fdfed572b98 |  grep -w running
	if [ $? = 0 ]; then
		aws ec2 stop-instances --instance-ids i-06f870fdfed572b98 >> /dev/null
		echo "ansible host 1 is shuting down"
		echo "ansible host1 is down" | mail -s "ansible host1" linuxtechnologies@hotmail.com
	fi

	#ansible host 2
	aws ec2 describe-instance-status --instance-ids i-0baff9f2fcb8f4356 |  grep -w running
	if [ $? = 0 ]; then
		aws ec2 stop-instances --instance-ids i-0baff9f2fcb8f4356 >> /dev/null
		echo "ansible host 2 is shuting down"
		echo "ansible host2 is down" | mail -s "ansible host2" linuxtechnologies@hotmail.com
	fi

	#ansible desktop
	aws ec2 describe-instance-status --instance-ids i-02d988c750d98c131  |  grep -w running
	if [ $? = 0 ]; then
		aws ec2 stop-instances --instance-ids i-02d988c750d98c131 >> /dev/null
		echo "ansible desktop is shuting down"
		echo "ansible desktop is down" | mail -s "ansible desktop" linuxtechnologies@hotmail.com
	fi

elif [ $1 = start ]; then
	#ansible host 1
	#host1=`aws ec2 describe-instance-status --instance-ids i-06f870fdfed572b98 |  grep -w running`
	aws ec2 describe-instance-status --instance-ids i-06f870fdfed572b98 |  grep -w running
	if [ $? -ne 0 ]; then
		aws ec2 start-instances --instance-ids i-06f870fdfed572b98 >> /dev/null
		echo "ansible host 1 is starting up"
		echo "ansible host1 is up" | mail -s "ansible host1" linuxtechnologies@hotmail.com
	fi

	#ansible host 2
	aws ec2 describe-instance-status --instance-ids i-0baff9f2fcb8f4356 |  grep -w running
	if [ $? -ne 0 ]; then
		aws ec2 start-instances --instance-ids i-0baff9f2fcb8f4356 >> /dev/null
		echo "ansible host 2 is starting up"
		echo "ansible host2 is up" | mail -s "ansible host2" linuxtechnologies@hotmail.com
	fi

	#ansible desktop
	aws ec2 describe-instance-status --instance-ids i-02d988c750d98c131  |  grep -w running
	if [ $? -ne 0 ]; then
		aws ec2 start-instances --instance-ids i-02d988c750d98c131 >> /dev/null
		echo "ansible desktop is starting up"
		echo "ansible desktop is up" | mail -s "ansible desktop" linuxtechnologies@hotmail.com
	fi
fi
