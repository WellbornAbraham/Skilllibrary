---
permalink: /assets/sh/buildresources.sh
---
{% if site.buildresources == true %}
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
BLACK="\033[0;30m"
DGRAY="\033[1;30m"
RED="\033[0;31m"
LRED="\033[1;31m"
GREEN="\033[0;32m"
LGREEN="\033[1;32m"
ORANGE="\033[0;33m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
LBLUE="\033[1;34m"
PURPLE="\033[0;35m"
LPURPLE="\033[1;35m"
CYAN="\033[0;36m"
LCYAN="\033[1;36m"
LGRAY="\033[0;37m"
WHITE="\033[1;37m"
NC="\033[0m" # No Color
echo -e "${BLUE}buildresources started${NC}"
{% assign languages = site.data.language_codes_bash.lang %}{% for language in languages %}{% if language.code.output == true %}
SOURCEFOLDER{{ language.code.uppercase }}="skilllibrary/siteGen/languages/_{{ language.code.lowercase }}/resources"
BUILDFOLDER{{ language.code.uppercase }}="skilllibrary/playground/buildresources/_{{ language.code.lowercase }}/resources"
echo -e "started building ${PURPLE}{{ language.code.lowercase }} ${NC}resources"
cd ~
rsync -rh --delete ${SOURCEFOLDER{{ language.code.uppercase }}}/ ${BUILDFOLDER{{ language.code.uppercase }}}
{% assign datafile = site.data.datafile.data %}
{% if datafile[0] %}{% assign datafile = datafile | sort: "title.en" %}{% for item in datafile %}{% if item.deploy.en != site.development %}
touch ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}.html
if [ -s ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}.html ]
then
:
else
cat >> ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}.html << EOF
---
title: {{ item.title2[ language.code.lowercase ] }}
layout: topics-l1
lang: {{ language.code.lowercase }}
l0: {% if language.code.lowercase == "en" %}{{ site.data.word_translate.resources.en }}{% endif %}{% if language.code.lowercase == "fr" %}{{ site.data.word_translate.resources.fr }}{% endif %}{% if language.code.lowercase == "ar" %}{{ site.data.word_translate.resources.ar }}{% endif %}{% if language.code.lowercase == "es" %}{{ site.data.word_translate.resources.es }}{% endif %}
l1: {{ item.title.en }}
---

EOF
fi
sed -i "1,7d" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}.html
sed -i "1i ---" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}.html
sed -i "1i l1: {{ item.title.en }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}.html
sed -i "1i l0: {% if language.code.lowercase == "en" %}{{ site.data.word_translate.resources.en }}{% endif %}{% if language.code.lowercase == "fr" %}{{ site.data.word_translate.resources.fr }}{% endif %}{% if language.code.lowercase == "ar" %}{{ site.data.word_translate.resources.ar }}{% endif %}{% if language.code.lowercase == "es" %}{{ site.data.word_translate.resources.es }}{% endif %}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}.html
sed -i "1i lang: {{ language.code.lowercase }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}.html
sed -i "1i layout: topics-l1" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}.html
sed -i "1i title: {{ item.title2[ language.code.lowercase ] }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}.html
sed -i "1i ---" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}.html
mkdir ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }} 2>/dev/null
{% assign level1-unsorted = item.children %}{% if level1-unsorted[0] %}{% assign level1 = level1-unsorted %}{% for entry in level1 %}{% if entry.deploy.en != site.development %}
mkdir ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }} 2>/dev/null
echo -e "building ${ORANGE}{{ entry.title.en | slugify: "pretty" }} ${NC}"
touch ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}.html
if [ -s ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}.html ]
then
:
else
cat >> ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}.html << EOF
---
title: {{ entry.title2[ language.code.lowercase ] }}
layout: topics-l2
lang: {{ language.code.lowercase }}
l0: {% if language.code.lowercase == "en" %}{{ site.data.word_translate.resources.en }}{% endif %}{% if language.code.lowercase == "fr" %}{{ site.data.word_translate.resources.fr }}{% endif %}{% if language.code.lowercase == "ar" %}{{ site.data.word_translate.resources.ar }}{% endif %}{% if language.code.lowercase == "es" %}{{ site.data.word_translate.resources.es }}{% endif %}
l1: {{ item.title.en }}
l2: {{ entry.title.en }}
---

EOF
fi
sed -i "1,8d" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}.html
sed -i "1i ---" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}.html
sed -i "1i l2: {{ entry.title.en }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}.html
sed -i "1i l1: {{ item.title.en }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}.html
sed -i "1i l0: {% if language.code.lowercase == "en" %}{{ site.data.word_translate.resources.en }}{% endif %}{% if language.code.lowercase == "fr" %}{{ site.data.word_translate.resources.fr }}{% endif %}{% if language.code.lowercase == "ar" %}{{ site.data.word_translate.resources.ar }}{% endif %}{% if language.code.lowercase == "es" %}{{ site.data.word_translate.resources.es }}{% endif %}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}.html
sed -i "1i lang: {{ language.code.lowercase }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}.html
sed -i "1i layout: topics-l2" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}.html
sed -i "1i title: {{ entry.title2[ language.code.lowercase ] }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}.html
sed -i "1i ---" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}.html
{% assign level2-unsorted = entry.children %}{% if level2-unsorted[0] %}{% assign level2 = level2-unsorted %}{% for subentry in level2 %}{% if subentry.deploy.en != site.development %}
mkdir ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }} 2>/dev/null
touch ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html
if [ -s ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html ]
then
:
else
cat >> ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html << EOF
---
title: {{ subentry.title2[ language.code.lowercase ] }}
layout: topics-l3
lang: {{ language.code.lowercase }}
l0: {% if language.code.lowercase == "en" %}{{ site.data.word_translate.resources.en }}{% endif %}{% if language.code.lowercase == "fr" %}{{ site.data.word_translate.resources.fr }}{% endif %}{% if language.code.lowercase == "ar" %}{{ site.data.word_translate.resources.ar }}{% endif %}{% if language.code.lowercase == "es" %}{{ site.data.word_translate.resources.es }}{% endif %}
l1: {{ item.title.en }}
l2: {{ entry.title.en }}
l3: {{ subentry.title.en }}
---

EOF
fi
sed -i "1,9d" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html
sed -i "1i ---" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html
sed -i "1i l3: {{ subentry.title.en }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html
sed -i "1i l2: {{ entry.title.en }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html
sed -i "1i l1: {{ item.title.en }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html
sed -i "1i l0: {% if language.code.lowercase == "en" %}{{ site.data.word_translate.resources.en }}{% endif %}{% if language.code.lowercase == "fr" %}{{ site.data.word_translate.resources.fr }}{% endif %}{% if language.code.lowercase == "ar" %}{{ site.data.word_translate.resources.ar }}{% endif %}{% if language.code.lowercase == "es" %}{{ site.data.word_translate.resources.es }}{% endif %}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html
sed -i "1i lang: {{ language.code.lowercase }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html
sed -i "1i layout: topics-l3" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html
sed -i "1i title: {{ subentry.title2[ language.code.lowercase ] }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html
sed -i "1i ---" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}.html
{% assign level3-unsorted = subentry.children %}{% if level3-unsorted[0] %}{% assign level3 = level3-unsorted | sort: "title" %}{% for subsubentry in level3 %}{% if subsubentry.deploy.en != site.development %}
touch ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html
if [ -s ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html ]
then
:
else
cat >> ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html << EOF
---
title: {{ subsubentry.title2[ language.code.lowercase ] }}
layout: topics-l4
lang: {{ language.code.lowercase }}
l0: {% if language.code.lowercase == "en" %}{{ site.data.word_translate.resources.en }}{% endif %}{% if language.code.lowercase == "fr" %}{{ site.data.word_translate.resources.fr }}{% endif %}{% if language.code.lowercase == "ar" %}{{ site.data.word_translate.resources.ar }}{% endif %}{% if language.code.lowercase == "es" %}{{ site.data.word_translate.resources.es }}{% endif %}
l1: {{ item.title.en }}
l2: {{ entry.title.en }}
l3: {{ subentry.title.en }}
l4: {{ subsubentry.title.en }}
---

EOF
fi
sed -i "1,10d" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html
sed -i "1i ---" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html
sed -i "1i l4: {{ subsubentry.title.en }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html
sed -i "1i l3: {{ subentry.title.en }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html
sed -i "1i l2: {{ entry.title.en }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html
sed -i "1i l1: {{ item.title.en }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html
sed -i "1i l0: {% if language.code.lowercase == "en" %}{{ site.data.word_translate.resources.en }}{% endif %}{% if language.code.lowercase == "fr" %}{{ site.data.word_translate.resources.fr }}{% endif %}{% if language.code.lowercase == "ar" %}{{ site.data.word_translate.resources.ar }}{% endif %}{% if language.code.lowercase == "es" %}{{ site.data.word_translate.resources.es }}{% endif %}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html
sed -i "1i lang: {{ language.code.lowercase }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html
sed -i "1i layout: topics-l4" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html
sed -i "1i title: {{ subsubentry.title2[ language.code.lowercase ] }}" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html
sed -i "1i ---" ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }}/{{ entry.title.en | slugify: "pretty" }}/{{ subentry.title.en | slugify: "pretty" }}/{{ subsubentry.title.en | slugify: "pretty" }}.html
{% endif %}{% endfor %}{% endif %}
{% endif %}{% endfor %}{% endif %}
## echo -e "completed ${ORANGE}{{ entry.title.en | slugify: "pretty" }} ${NC}"
{% endif %}{% endfor %}{% endif %}
echo -e "completed directory ${BLUE} ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title.en | slugify: "pretty" }} ${NC}"
{% endif %}{% endfor %}{% endif %}
NEWFOLDER="skilllibrary/playground/buildresources/backup/_{{ language.code.lowercase }}/resources"
mkdir ${NEWFOLDER} 2>/dev/null
rm -r ${NEWFOLDER}/*
mv ${SOURCEFOLDER{{ language.code.uppercase }}}/* ${NEWFOLDER}/
cp -r ${BUILDFOLDER{{ language.code.uppercase }}}/* ${SOURCEFOLDER{{ language.code.uppercase }}}/
echo -e "completed building ${PURPLE}{{ language.code.lowercase }} ${NC}resources"
{% endif %}{% endfor %}
echo -e "${BLUE}buildresources completed${NC}"
{% endif %}