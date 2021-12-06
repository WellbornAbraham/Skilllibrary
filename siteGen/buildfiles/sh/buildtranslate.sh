---
permalink: /assets/sh/buildtranslate.sh
---
{% if site.buildtranslate == true %}
#!/bin/bash

# Black        0;30
# Dark Gray     1;30
# Red          0;31
# Light Red     1;31
# Green        0;32
# Light Green   1;32
# Brown/Orange 0;33
# Yellow        1;33
# Blue         0;34
# Light Blue    1;34
# Purple       0;35
# Light Purple  1;35
# Cyan         0;36
# Light Cyan    1;36
# Light Gray   0;37
# White         1;37
BLACK='\033[0;30m'
DGRAY='\033[1;30m'
RED='\033[0;31m'
LRED='\033[1;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LBLUE='\033[1;34m'
PURPLE='\033[0;35m'
LPURPLE='\033[1;35m'
CYAN='\033[0;36m'
LCYAN='\033[1;36m'
LGRAY='\033[0;37m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color
echo -e "${BLUE}buildtranslate started${NC}"
cd ~
cp -r  ~/skilllibrary/playground/buildtranslate/pre_translate/ ~/skilllibrary/playground/buildtranslate/backup/
cp -r  ~/skilllibrary/playground/buildtranslate/translate/ ~/skilllibrary/playground/buildtranslate/backup/
cp -r  ~/skilllibrary/playground/buildtranslate/post_translate/ ~/skilllibrary/playground/buildtranslate/backup/
rsync -rh --delete ~/skilllibrary/siteGen/website_temp/assets/buildtranslate/pre_translate/  ~/skilllibrary/playground/buildtranslate/pre_translate
rsync -rh --delete ~/skilllibrary/siteGen/website_temp/assets/buildtranslate/translate/  ~/skilllibrary/playground/buildtranslate/translate
rsync -rh --delete ~/skilllibrary/siteGen/website_temp/assets/buildtranslate/post_translate/  ~/skilllibrary/playground/buildtranslate/post_translate
{% assign languages = site.data.language_codes_bash.lang %}{% for language in languages %}{% if language.code.output == true %}
echo -e "building ${PURPLE}{{ language.code.lowercase }} ${NC}translate"
cd ~/skilllibrary/playground/buildtranslate/;
rm -r post_translate/{{ language.code.lowercase }}/*
mkdir temp/;
mkdir temp/{{ language.code.lowercase }}/;
original_default_file="pre_translate/default.txt"
original_language_file="translate/{{ language.code.lowercase }}/title.txt"
temp_default_file="temp/default.txt"
temp_language_file="temp/{{ language.code.lowercase }}/title.txt"
destination="post_translate/{{ language.code.lowercase }}/{{ language.code.lowercase }}_title.txt"
touch temp_default_file;
touch temp_language_file;
tac $original_default_file > $temp_default_file;
tac $original_language_file > $temp_language_file;
echo " " > $destination;
while read -r -u 3 default_name && read -r -u 4 language_name;
do
sed -i $"1i \ \ $default_name: $language_name" $destination;
done 3<"$temp_default_file" 4<"$temp_language_file"
sed -i "1i title:" $destination;

original_default_file="pre_translate/default.txt"
original_language_file="translate/{{ language.code.lowercase }}/title2.txt"
temp_default_file="temp/default.txt"
temp_language_file="temp/{{ language.code.lowercase }}/title2.txt"
destination="post_translate/{{ language.code.lowercase }}/{{ language.code.lowercase }}_title2.txt"
touch temp_default_file;
touch temp_language_file;
tac $original_default_file > $temp_default_file;
tac $original_language_file > $temp_language_file;
echo " " > $destination;
while read -r -u 3 default_name && read -r -u 4 language_name;
do
sed -i $"1i \ \ $default_name: $language_name" $destination;
done 3<"$temp_default_file" 4<"$temp_language_file"
sed -i "1i title2:" $destination;

original_default_file="pre_translate/default.txt"
original_language_file="translate/{{ language.code.lowercase }}/sub_title.txt"
temp_default_file="temp/default.txt"
temp_language_file="temp/{{ language.code.lowercase }}/sub_title.txt"
destination="post_translate/{{ language.code.lowercase }}/{{ language.code.lowercase }}_sub_title.txt"
touch temp_default_file;
touch temp_language_file;
tac $original_default_file > $temp_default_file;
tac $original_language_file > $temp_language_file;
echo " " > $destination;
while read -r -u 3 default_name && read -r -u 4 language_name;
do
sed -i $"1i \ \ $default_name: $language_name" $destination;
done 3<"$temp_default_file" 4<"$temp_language_file"
sed -i "1i sub_title:" $destination;

original_default_file="pre_translate/default.txt"
original_language_file="translate/{{ language.code.lowercase }}/label.txt"
temp_default_file="temp/default.txt"
temp_language_file="temp/{{ language.code.lowercase }}/label.txt"
destination="post_translate/{{ language.code.lowercase }}/{{ language.code.lowercase }}_label.txt"
touch temp_default_file;
touch temp_language_file;
tac $original_default_file > $temp_default_file;
tac $original_language_file > $temp_language_file;
echo " " > $destination;
while read -r -u 3 default_name && read -r -u 4 language_name;
do
sed -i $"1i \ \ $default_name: $language_name" $destination;
done 3<"$temp_default_file" 4<"$temp_language_file"
sed -i "1i label:" $destination;

original_default_file="pre_translate/default.txt"
original_language_file="translate/{{ language.code.lowercase }}/excerpt.txt"
temp_default_file="temp/default.txt"
temp_language_file="temp/{{ language.code.lowercase }}/excerpt.txt"
destination="post_translate/{{ language.code.lowercase }}/{{ language.code.lowercase }}_excerpt.txt"
touch temp_default_file;
touch temp_language_file;
tac $original_default_file > $temp_default_file;
tac $original_language_file > $temp_language_file;
echo " " > $destination;
while read -r -u 3 default_name && read -r -u 4 language_name;
do
sed -i $"1i \ \ $default_name: $language_name" $destination;
done 3<"$temp_default_file" 4<"$temp_language_file"
sed -i "1i excerpt:" $destination;

rm -r temp/;
rm  temp_default_file;
rm  temp_language_file;
cd post_translate/{{ language.code.lowercase }}/
cat {{ language.code.lowercase }}_title.txt {{ language.code.lowercase }}_title2.txt {{ language.code.lowercase }}_sub_title.txt {{ language.code.lowercase }}_label.txt {{ language.code.lowercase }}_excerpt.txt > {{ language.code.lowercase }}_translate.txt
rm ~/skilllibrary/siteGen/_data/backup/{{ language.code.lowercase }}_translate.yml
mv ~/skilllibrary/siteGen/_data/{{ language.code.lowercase }}_translate.yml ~/skilllibrary/siteGen/_data/backup/{{ language.code.lowercase }}_translate.yml
cp {{ language.code.lowercase }}_translate.txt ~/skilllibrary/siteGen/_data/{{ language.code.lowercase }}_translate.yml
{% endif %}{% endfor %}
rsync -rh --delete ~/skilllibrary/playground/buildtranslate/pre_translate/ ~/skilllibrary/siteGen/assets/buildtranslate/pre_translate
rsync -rh --delete ~/skilllibrary/playground/buildtranslate/translate/ ~/skilllibrary/siteGen/assets/buildtranslate/translate
rsync -rh --delete ~/skilllibrary/playground/buildtranslate/post_translate/ ~/skilllibrary/siteGen/assets/buildtranslate/post_translate
echo -e "${BLUE}buildtranslate completed${NC}"
{% endif %}