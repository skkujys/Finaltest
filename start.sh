#!/bin/bash
n='n'
y='y'
yn1='n'
echo "If you don't have Github ID, make it first -> copy! : https://github.com/"
read -p "If you done, type y. [y/n] : " yn1
while [ ${yn1} == ${n} ]
do
	read -p "Done? [y/n] : " yn1
done
userid='none'
email='none'
yn2='n'
Rname='default'
echo "If you done, let me check your informations"
read -p "Your ID : " userid
read -p "Your email : " email
sed -i "s/userid=\".*\"/userid=\"$userid\"/" userinfo.txt
sed -i "s/email=\".*\"/email=\"$email\"/" userinfo.txt
echo "Then, you have to make your New Repository -> copy! https://github.com/new"
read -p "If you done, type y. [y/n] : " yn2
while [ $yn2 == ${n} ]
do
	read -p "Done? [y/n] : " yn2
done
read -p "Write your Repository name here : " Rname
sed -i "s/Rname=\".*\"/Rname=\"$Rname\"/" userinfo.txt
yn3='y'
read -p "Did you installed git? If not, I'll install it for you. [y/n] : " yn3 
if [ $yn3 == ${n} ]
then
	apt-get install git
	apt install git
	echo "Your git version"
	git --version
fi
echo "Now initial setting... please wait a seconds"
source userinfo.txt
git config --global user.name $userid
git config --global user.email $email
git init
echo "Your Git initial settings are successfully completed. Now make your own directorys and files, and upload it or download some files from Github"
