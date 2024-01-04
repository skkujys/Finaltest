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
NE='default'
val1='New'
val2='Exist'
yn5='n'
yn0='n'
read -p "Did you get Token already? [y/n] : " yn0
if [ ${yn0} == ${n} ]
then
echo -e "Get Token first! copy! -> https://github.com/settings/tokens\n"
echo -e "Recommended : Check 'repo', 'workflow', 'write:packages', 'admin:org' on Select scopes\n"
read -p "If you got token, Type your token password here : " pswd
sed -i "s|pswd=\".*\"|pswd=\"$pswd\"|" userinfo.txt
fi
echo -e "\n"
read -p "Select the mode [New : you made new Repository and want to upload there / Exist : want to upload exist Repository] : " NE
echo -e "\n"
if [ ${NE} == ${val1} ]
then
read -p "Repository URL is needed. Have you ever typed it here? [y/n] : " yn3
echo -e "\n"
if [ ${yn3} == ${n} ]
then
	read -p "Write your Repository URL : " rurl
	sed -i "s|rurl=\".*\"|rurl=\"$rurl\"|" userinfo.txt
fi
source userinfo.txt
git remote add origin $rurl
A=$(git branch)
echo "Branch : "$A
read -p "Now you confirmed your local storage branch name. Is it 'main?'(If it is not 'main', you have to change it to 'main') [y/n] : " yn4
echo -e "\n"
while [ ${yn4} == ${n} ]
do
	git branch -m master main
	echo "Branch : "$(git branch)
	read -p "Still not 'main'? [y/n] " yn4
done
git pull

echo -e "Type file or folder names you want to upload\n"
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
echo -e "\n"
read -p "Do you want to type commit logs? [y/n] : " yn2
echo -e "\n"
if [ ${yn2} == ${y} ]
then
	read -p "Type your commit messages : " commitmsg
	git commit -m $commitmsg
fi
source userinfo.txt
remote_url="https://${userid}:${pswd}@github.com/${userid}/${Rname}.git"
sed -i "s|remote_url=\".*\"|remote_url=\"$remote_url\"|" userinfo.txt
git remote set-url origin $remote_url
git push origin main
fi

yn6='n'

if [ ${NE} == ${val2} ]
then
	git pull origin main
	git add .
	read -p "Do you want to type commit logs? [y/n] : " yn6
	echo -e "\n"
	if [ ${yn6} == ${y} ]
	then
		read -p "Type your commit messages : " commitmsg
		git commit -m $commitmsg
	fi
source userinfo.txt
git remote set-url origin $remote_url
git push origin main
fi

