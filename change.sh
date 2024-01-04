#!/bin/bash
n='n'
y='y'
yn1='n'
yn2='n'
yn3='n'
yn4='n'
rurl='default'
fname='default'
read -p "Do you want to change the connected remote Repository? [y/n] : " yn1
if [ ${yn1} == ${y} ]
then
	git remote rm origin
	read -p "Write your New Repository URL here : " rurl
	sed -i "s|rurl=\".*\"|rurl=\"$rurl\"|" userinfo.txt
	source userinfo.txt
	git remote add origin $rurl
fi

read -p "Do you want to change the status of your local Repository? [y/n] : " yn2
if [ ${yn2} == ${y} ]
then
	while [ ${yn3} == ${n} ]
	do
	read -p "Write file name you want to delete : " fname
	git rm --cached $fname
	read -p "Done? [y/n] : " yn3
	done

	while [ ${yn4} == ${n} ]
	do
		read -p "Write file name you want to add : " fname
		git add $fname
		read -p "Done? [y/n] : " yn4
	done
fi
