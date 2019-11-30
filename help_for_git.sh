#!/bin/bash
# work with git 
sudo chmod -R 777 html/
cd html/
git clone https://github.com/Tiridat/Armath_Depi_Araj.git
# UserName: Tiridat
# Password: 170819@asdf
cd Armath_Depi_Araj/
git init
echo "# BlogName: Armath Depi Araj
      # Author  : Trdat Shakhbazyan
      # Date    : 28.11.2019" >> README.md
git config --global user.name "Trdat Shakhbazyan"
git config --global user.email "tiridates@mail.ru"
git add .
git status
git commit -m "First Readme File"
git remote add orogin https://github.com/Tiridat/Armath_Depi_Araj.git
git push -u origin master
git pull # new files from remote
#git fetch
