FROM tomcat:9.0.65-jdk17-corretto
ARG JAR_FILE=target/*.jar
ENV BOT_NAME=bot_name
ENV BOT_TOKEN=bot_token
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-Dbot.username=${BOT_NAME}", "-Dbot.token=${BOT_TOKEN}", "-jar", "/app.jar"]