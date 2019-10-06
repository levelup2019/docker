#!/usr/bin/env bash

remoteHost=ubuntu@54.191.176.1
remoteBackupFolder=/home/ubuntu/backup/
fileSize=1024
backupAge=7

function createFile() {
    sudo touch $1 \
    && sudo chmod 777 $1 \
    && echo $1' created'
}

function populateFile() {
    sudo < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${fileSize} > $1 \
    && echo $1' populated'
}

function exportFile() {
    scp $(pwd)/$1 ${remoteHost}:${remoteBackupFolder} \
    && echo $1' exported'
}

function deleteOldRemoteBackups() {
    ssh ${remoteHost} 'find '${remoteBackupFolder}' -mtime +'${backupAge}' -type f -delete' \
    && echo 'outdated backups deleted from remote host'
}
########## MAIN PROCESS ##########

for i in {0..9}; do
    fileName=file_'#'${i}_`date +"%Y-%m-%d-%H:%M:%S"`.txt
    createFile ${fileName} \
    && populateFile ${fileName} \
    && exportFile ${fileName}
done

deleteOldRemoteBackups