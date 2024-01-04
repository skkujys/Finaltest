#!/bin/bash
durl="default"
yn1='n'
n='n'
y='y'
echo "Before download files, check the present directory is for your local Repository"
read -p "[Continue : y/ Stop : n]" yn1
if [ ${yn1} == ${y} ]
then
read -p "If you want download some files, Type Repository URL : " durl
git clone $durl
fi

