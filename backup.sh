#!/bin/bash
PASSED=$1

YELLOW='\033[1;33m'
LIGHT_GREEN='\033[1;32m'
LIGHT_RED='\033[1;31m'
LIGHT_BLUE='\033[1;34m'
NC='\033[0m' # No Color

if ! command -v zip &> /dev/null
then
    echo -e "${NC}[${LIGHT_BLUE}Backup Tool${NC}] ${LIGHT_RED}zip is not installed! ${YELLOW}Installing zip...${NC}"
    apt install zip
fi

if [ -d "${PASSED}" ]
	then
		zip -r "$(date +"%Y.%m.%d-%H:%M")_$1-backup.zip" $1
		echo -e "${NC}[${LIGHT_BLUE}Backup Tool${NC}] ${LIGHT_GREEN}Backup of directory ${YELLOW}$1 ${LIGHT_GREEN}was successful. You can find it in ${YELLOW}${PWD}/BACKUP/$(date +"%Y.%m.%d-%H:%M")_$1-backup.zip${LIGHT_GREEN}.${NC}"
		if [ -d "BACKUP" ]
			then	
				sleep 2
				mv "$(date +"%Y.%m.%d-%H:%M")_$1-backup.zip" "BACKUP"
			else
				mkdir BACKUP
				sleep 2
				mv "$(date +"%Y.%m.%d-%H:%M")_$1-backup.zip" "BACKUP"
		fi
	else
		echo -e "${NC}[${LIGHT_BLUE}Backup Tool${NC}] Usage: ./backup.sh <directory path>"
		echo -e "${NC}[${LIGHT_BLUE}Backup Tool${NC}] ${LIGHT_RED}Please specify a directory path to back up!${NC}"
fi
