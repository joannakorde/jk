#!/bin/bash

#Instalacja gita
sudo apt-get update
sudo apt-get install -y git

#Tworzenie nowej galezi przez checkout i przeniesienie do nowego rozgalezienia
echo "Nazwa uzytkownika: " && git config --global user.name
echo "Adres email: " && git config --global user.email
git clone https://github.com/joannakorde/jk.git jk
cd jk
echo "Podaj nazwe nowej galezi:"
read branch
if [[ $branch ]]; then
  git checkout -b ${branch}
else
  git checkout -b projekt
fi

#Dodanie pliku t1.txt z pomocą petli for oraz .gitignore
echo -e ".gitignore\nt3.txt\nt4.txt\nt5.txt\nt6.txt">.gitignore
for x in one two three four
do
  echo "$x">>t1.txt
done
git add .
git commit -m "Dodano: t1.txt"

#Przeniesienie do podstawowej galezi i mergowanie. Utworzenie pliku t3.txt z wynikiem działania programu read.c
git checkout master
if [[ $branch ]]; then
  git merge ${branch}
else
  git merge projekt
fi
echo "one">>t1.txt
gcc read.c
./a.out t1.txt t2.txt >t3.txt
git add .
git commit -m "Usuniecie t1.txt"

#Cofnięcie do pierwszego utworzonego commitu i zresetowanie pliku t1.txt"
echo -e "one\nthree">t2.txt
gcc read.c
./a.out t1.txt t2.txt >t4.txt
git checkout HEAD t2.txt
gcc read.c
./a.out t1.txt t2.txt >t5.txt
git reset HEAD~1
git checkout master t1.txt


gcc read.c
./a.out t1.txt t2.txt >t6.txt
while [[ true ]]; do
  echo "Co chcesz zrobic?"
  select y in "Stworzenie nowego remote-a oraz push reporytorium" "Usuniecie katalogu posiadającego reporytorium" "Wyświetlenie wyników read.c" "Wyłączenie skryptu"
  do
    case $y in
      "Utworzenie nowego remote-a oraz push reporytorium") git remote remove origin; echo "Wpisz url git-a na który ma zostać zrobiony push"; read url; git remote add projekt $url; git push projekt ;;
      "Usuniecie katalogu posiadającego reporytorium") cd ..; rm -rf jk; exit ;;
      "Wyświetlenie wyników readline.c") echo -e "\n****** t3.txt ******"; more t3.txt;echo -e "\n****** t4.txt ******"; more t4.txt;echo -e "\n****** t5.txt ******"; more t5.txt;echo -e "\n****** t6.txt ******"; more t6.txt ;;
      "Wyłączenie skryptu") exit ;;
      *) echo "Nic nie wybrałeś"
    esac
    break
    done
done
