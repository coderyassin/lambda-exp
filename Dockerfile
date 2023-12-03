FROM maven:3.8.3-openjdk-17 as mvnjdk
WORKDIR /usr/src/app
COPY . .
RUN mvn clean install -DskipTests

FROM alpine:3.13.6
ARG SERVER=192.168.1.50
ARG USER=yascode
ARG PASS=YassMel97

WORKDIR /usr/src/app
COPY --from=mvnjdk /usr/src/app/target/*.jar my-app.jar
RUN apk add --update --no-cache openssh sshpass sudo
RUN sshpass -p $PASS scp -o StrictHostKeyChecking=no my-app.jar $USER@$SERVER:/tmp
RUN sshpass -p $PASS ssh -o StrictHostKeyChecking=no $USER@$SERVER mv /tmp/my-app.jar /home/yascode/new-app
RUN sshpass -p $PASS ssh -o StrictHostKeyChecking=no $USER@$SERVER "echo $PASS | sudo -S systemctl restart myapp.service"