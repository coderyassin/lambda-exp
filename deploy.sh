#!/bin/bash

JAR_FILE=/app/target/my-app.jar
REMOTE_USER=yascode
REMOTE_HOST=192.168.120.17
REMOTE_PATH=/home/yascode/new-app
SSH_PASSWORD=YassMel97

# Transférer le fichier JAR vers le serveur
sshpass -p $SSH_PASSWORD scp $JAR_FILE $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH

# Connexion au serveur pour exécuter la commande Java -jar
sshpass -p $SSH_PASSWORD ssh $REMOTE_USER@$REMOTE_HOST "java -jar $REMOTE_PATH/my-app.jar"

java -jar /app/target/my-app.jar
