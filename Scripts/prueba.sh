#!bin/bash
cd ~/
git clone https://github.com/TakYzGG/DotFiles
cp DotFiles/i3       -r ~/.config/
cp DotFiles/i3blocks -r ~/.config/
cd ~/.config/i3
mv config.txt config
