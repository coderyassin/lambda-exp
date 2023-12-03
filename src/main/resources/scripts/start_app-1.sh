#!/bin/bash

log_file="/home/yascode/app/logs/devops-1-$(date +'%Y-%m-%d_%H-%M-%S').log"
logs_centralises="/home/yascode/app/logs/devops-centralises.log"

sleep 30

java -jar /home/yascode/app/devops-0.0.1-SNAPSHOT.jar --server.port=8081 2>&1 | tee -a "$log_file" "$logs_centralises"



