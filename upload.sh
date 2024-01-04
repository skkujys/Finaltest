#!/bin/bash
n='n'
y='y'
fname='default'
yn1='n'
commitmsg='default'
yn2='n'
rurl='default'
yn3='n'
yn4='n'
pswd='n'
NE=1
val1=1
val2=2
echo "Get Token first! copy! -> https://github.com/settings/tokens"
read -p "If you got token, Type your token password here : " pswd
sed -i "s/pswd=\".*\"/pswd=\"$pswd\"/" userinfo.txt

read -p "Select the mode [New : 1/Exist : 2] : " NE
if [ ${NE} -eq ${val1} ]
then
read -p "Repository URL is needed. Have you ever typed it here? [y/n] : " yn3
if [ ${yn3} == ${n} ]
then
	read -p "Write your Repository URL : " rurl
	sed -i "s|rurl=\".*\"|rurl=\"$rurl\"|" userinfo.txt
fi
source userinfo.txt
git remote add origin $rurl
A=$(git branch)
echo "Branch : "$A
read -p "Now you confirmed your local storage branch name. Is it 'master?'(If it is 'master', you have to change it to 'main') [y/n] : " yn4
while [ ${yn4} == ${y} ]
do
	git branch -m master main
	echo "Branch : "
	git branch
	read -p "Still 'master'? [y/n] " yn4
done
git pull

echo "Type file or folder names you want to upload"
while [ ${yn1} == ${n} ]
do
	read -p "File or Folder name : " fname
	git add $fname
	read -p "Do you want to cancel? [y/n] : " yn4
	if [ ${yn4} == ${y} ]
	then
		git rm --cached $fname
	fi
	read -p "Done? [y/n] : " yn1
done

read -p "Do you want to type commit logs? [y/n] : " yn2
if [ ${yn2} == ${y} ]
then
	read -p "Type your commit messages" commitmsg
	git commit -m $commitmsg
fi
git push origin main
fi

yn6='n'

if [ ${NE} -eq ${val2} ]
then
	git pull origin main
	git add .
	read -p "Do you want to type commit logs? [y/n] : " yn6
	if [ ${yn6} == ${y} ]
	then
		read -p "Type your commit messages" commitmsg
		git commit -m $commitmsg
	fi
git push origin main
fi

