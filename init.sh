#!/bin/bash
yn1='n'
yn2='n'
n='n'
y='y'
echo -e "\n"
read -p "Do you want to disconnect from an existing remote Repository? [y/n] : " yn1
echo -e "\n"
if [ ${yn1} == ${y} ]
then
	git remote rm origin
fi

read -p "Do you want to initialize your local Repository? [y/n] : " yn2
echo -e "\n"
if [ ${yn1} == ${y} ]
then
	git rm --cached -r .
fi
	
