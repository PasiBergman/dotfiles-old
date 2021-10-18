#!/bin/bash

#
# Variables
#
BASEPATH="${HOME}"
# PINGHOST="192.168.100.104"
# SCRIPT_PATH=$(dirname "$0")

if [ -z "$1" ]; then
	echo "Usage:"
	echo "/path/to/rsync-virtualmachines.sh <username>@<host>:<path>"
	echo "e.g."
	echo "${BASEPATH}/.config/zsh/script/rsync-virtualmachines.sh pasi@192.168.100.104:/home/pasi/Data/Parallels/"
	exit 1
fi
LOG_FILE="$BASEPATH/.cache/rsync-virtualmachines.log"
DestInfo=$1

function BackupVM() {
	[ -z "$1" ] && echo "VM name not specified" && return

	VM_NAME=$1
	COUNTER=$(/bin/ps -ef | /usr/bin/grep "$VM_NAME" | grep -v "grep" -c)
	if [[ $COUNTER -gt 0 ]]; then
		echo "$(date '+%Y-%m-%d %H:%M:%S') : $VM_NAME virtual machine or backup is running. Skip backup." >>"$LOG_FILE"
	else
		{
			echo "$(date '+%Y-%m-%d %H:%M:%S') : $VM_NAME virtual machine is stopped. Start backup."
			/usr/bin/caffeinate -i \
				/usr/local/bin/rsync --progress --delete --partial --compress --archive \
				-e "ssh -i \"$BASEPATH/.ssh/id_rsa\"" \
				"$BASEPATH/Parallels/$VM_NAME.pvm" "${DestUser}@${DestHost}:${DestPath}"
			echo "$(date '+%Y-%m-%d %H:%M:%S') : $VM_NAME virtual machine. Backup done."
		} >>"$LOG_FILE"
	fi
}

IFS='@'
read -a DestHostArr1 <<<"$DestInfo"
DestUser="${DestHostArr1[0]}"
DestHost="${DestHostArr1[1]}"
IFS=':'
read -a DestHostArr2 <<<"$DestHost"
DestHost="${DestHostArr2[0]}"
DestPath="${DestHostArr2[1]}"

echo "$(date '+%Y-%m-%d %H:%M:%S') : Started rsync-virtualmachines.sh" >>"$LOG_FILE"
echo "$(date '+%Y-%m-%d %H:%M:%S') : Destination=${DestUser}@${DestHost}:${DestPath}" >>"$LOG_FILE"

# Backing up some odd files
rsync -a /etc/hosts "$BASEPATH/script/"

IPvalid1=true
/sbin/ping -c 2 "$DestHost" >/dev/null
IPvalid1=$?

if [[ $IPvalid1 -ne true ]]; then
	echo "$(date '+%Y-%m-%d %H:%M:%S') : Not connected to ${DestHost}. Exit." >>"$LOG_FILE"
	exit 0
fi
echo "$(date '+%Y-%m-%d %H:%M:%S') : Connected to ${DestHost}." >>"$LOG_FILE"

BackupVM "Windows 10 21H2"
BackupVM "Windows 10 2004"
BackupVM "Debian 10"
BackupVM "Arch Linux"
BackupVM "Arch Awesome"
BackupVM "Debian 11 Bullseye"

echo "$(date '+%Y-%m-%d %H:%M:%S') : rsync-virtualmachines.sh run completed." >>"$LOG_FILE"
