---
permalink: /assets/sh/buildincludes.sh
---
{% if site.buildincludes == true %}
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
echo -e "${BLUE}buildincludes started${NC}"
{% assign languages = site.data.language_codes_bash.lang %}{% for language in languages %}{% if language.code.output == true %}
SOURCEFOLDER{{ language.code.uppercase }}='skilllibrary/siteGen/_includes/{{ language.code.lowercase }}/resources'
BUILDFOLDER{{ language.code.uppercase }}='skilllibrary/playground/buildincludes/{{ language.code.lowercase }}/resources'
echo -e "started building ${PURPLE}{{ language.code.lowercase }} ${NC}_includes resources"
cd ~
rsync -rh --delete ${SOURCEFOLDER{{ language.code.uppercase }}}/ ${BUILDFOLDER{{ language.code.uppercase }}}
{% if language.code.lowercase == "en" %}{% assign datafile = site.data.datafileEN.data %}{% endif %}{% if language.code.lowercase == "fr" %}{% assign datafile = site.data.datafileFR.data %}{% endif %}{% if language.code.lowercase == "ar" %}{% assign datafile = site.data.datafileAR.data %}{% endif %}{% if language.code.lowercase == "es" %}{% assign datafile = site.data.datafileES.data %}{% endif %}
{% if datafile[0] %}{% assign datafile_buildincludes = datafile %}{% for item in datafile_buildincludes %}{% if item.deploy.en != site.development %}
{% if item.kind == "folder" %}
mkdir ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title | slugify: "default" }} 2>/dev/null
{% endif %}
{% if item.kind == "file" %}
touch ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title | slugify: "default" }}.md
{% endif %}
{% assign level1-unsorted = item.children %}{% if level1-unsorted[0] %}{% assign level1 = level1-unsorted %}{% for entry in level1 %}{% if entry.deploy.en != site.development %}
echo -e "building ${ORANGE}{{ entry.title | slugify: "default" }} ${NC}"
{% if item.kind == "folder" %}
mkdir ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title | slugify: "default" }}/{{ entry.title | slugify: "default" }} 2>/dev/null
{% endif %}
{% if item.kind == "file" %}
touch ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title | slugify: "default" }}/{{ entry.title | slugify: "default" }}.md
{% endif %}
{% assign level2-unsorted = entry.children %}{% if level2-unsorted[0] %}{% assign level2 = level2-unsorted %}{% for subentry in level2 %}{% if subentry.deploy.en != site.development %}
{% if item.kind == "folder" %}
mkdir ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title | slugify: "default" }}/{{ entry.title | slugify: "default" }}/{{ subentry.title | slugify: "default" }} 2>/dev/null
{% endif %}
{% if item.kind == "file" %}
touch ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title | slugify: "default" }}/{{ entry.title | slugify: "default" }}/{{ subentry.title | slugify: "default" }}.md
{% endif %}
{% assign level3-unsorted = subentry.children %}{% if level3-unsorted[0] %}{% assign level3 = level3-unsorted | sort: 'title' %}{% for subsubentry in level3 %}{% if subsubentry.deploy.en != site.development %}
{% if item.kind == "file" %}
touch ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title | slugify: "default" }}/{{ entry.title | slugify: "default" }}/{{ subentry.title | slugify: "default" }}/{{ subsubentry.title | slugify: "default" }}.md
{% endif %}
{% if item.kind == "folder" %}
mkdir ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title | slugify: "default" }}/{{ entry.title | slugify: "default" }}/{{ subentry.title | slugify: "default" }}/{{ subsubentry.title | slugify: "default" }}.md
{% endif %}
{% endif %}{% endfor %}{% endif %}
{% endif %}{% endfor %}{% endif %}
## echo -e "completed ${ORANGE}{{ entry.title | slugify: "default" }} ${NC}"
{% endif %}{% endfor %}{% endif %}
echo -e "completed directory ${BLUE} ${BUILDFOLDER{{ language.code.uppercase }}}/{{ item.title | slugify: "default" }} ${NC}"
{% endif %}{% endfor %}{% endif %}
NEWFOLDER="skilllibrary/playground/buildincludes/backup/{{ language.code.lowercase }}/resources"
mkdir ${NEWFOLDER} 2>/dev/null
rm -r ${NEWFOLDER}/*
mv ${SOURCEFOLDER{{ language.code.uppercase }}}/* ${NEWFOLDER}/
cp -r ${BUILDFOLDER{{ language.code.uppercase }}}/* ${SOURCEFOLDER{{ language.code.uppercase }}}/
echo -e "completed building ${PURPLE}{{ language.code.lowercase }} ${NC}resources"
{% endif %}{% endfor %}
echo -e "${BLUE}buildincludes completed${NC}"
{% endif %}