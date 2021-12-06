---
permalink: /assets/sh/catalogue.sh
---
{%- if site.catalogue_language == true -%}
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

echo -e "${BLUE}catalogue.sh started ${NC}"
cd ~/skilllibrary/
rm -r ~/skilllibrary/playground/catalogue/
mkdir ~/skilllibrary/playground/catalogue/
{%- assign languages = site.data.language_codes_bash.lang -%}{%- for language in languages -%}{%- if language.code.output == true %}
cd ~/skilllibrary/
mkdir ~/skilllibrary/playground/catalogue/{{ language.code.lowercase }}/
# cp ~/skilllibrary/scripts/languageAlphabets{{ language.code.uppercase }}.txt ~/skilllibrary/playground/catalogue/{{ language.code.lowercase }}/
cd ~/skilllibrary/playground/catalogue/{{ language.code.lowercase }}/
# languageAlphabets{{ language.code.uppercase }}="languageAlphabets{{ language.code.uppercase }}.txt";
# while read -r -u 3 language_letter;
# do
                  {%- if language.code.lowercase == "en" -%}
                  {%- assign languageAlphabets = site.data.languageAlphabets.latin -%}
                  {%- endif -%}
                  {%- if language.code.lowercase == "fr" -%}
                  {%- assign languageAlphabets = site.data.languageAlphabets.latin -%}
                  {%- endif -%}
                  {%- if language.code.lowercase == "ar" -%}
                  {%- assign languageAlphabets = site.data.languageAlphabets.arabic -%}
                  {%- endif -%}
                  {%- if language.code.lowercase == "es" -%}
                  {%- assign languageAlphabets = site.data.languageAlphabets.latin -%}
                  {%- endif -%}
{%- for item in languageAlphabets %}
echo " " > {{ item.alphabet.i }}.html;
sed -i $"1i ---" {{ item.alphabet.i }}.html;
sed -i $"1i alphabet_l1x: {{ item.alphabet.x }}" {{ item.alphabet.i }}.html;
sed -i $"1i alphabet_l1ix: {{ item.alphabet.ix }}" {{ item.alphabet.i }}.html;
sed -i $"1i alphabet_l1viii: {{ item.alphabet.viii }}" {{ item.alphabet.i }}.html;
sed -i $"1i alphabet_l1vii: {{ item.alphabet.vii }}" {{ item.alphabet.i }}.html;
sed -i $"1i alphabet_l1vi: {{ item.alphabet.vi }}" {{ item.alphabet.i }}.html;
sed -i $"1i alphabet_l1v: {{ item.alphabet.v }}" {{ item.alphabet.i }}.html;
sed -i $"1i alphabet_l1iv: {{ item.alphabet.iv }}" {{ item.alphabet.i }}.html;
sed -i $"1i alphabet_l1iii: {{ item.alphabet.iii }}" {{ item.alphabet.i }}.html;
sed -i $"1i alphabet_l1ii: {{ item.alphabet.ii }}" {{ item.alphabet.i }}.html;
sed -i $"1i alphabet_l1i: {{ item.alphabet.i }}" {{ item.alphabet.i }}.html;
sed -i $"1i alphabet_l1: {{ item.alphabet.i }}" {{ item.alphabet.i }}.html;
sed -i $"1i catalogue: alphabet" {{ item.alphabet.i }}.html;
sed -i $"1i title: {{ site.data.word_translate.catalogue[ language.code.lowercase ] }} {{ item.alphabet.i }}" {{ item.alphabet.i }}.html;
sed -i $"1i ---" {{ item.alphabet.i }}.html;
{%- endfor %}
# done 3<"$languageAlphabets{{ language.code.uppercase }}";
{%- endif -%} {%- endfor %}
echo -e "${BLUE}done ${NC}"
{%- endif -%}