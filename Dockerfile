FROM tomcat:9.0.65-jdk17-corretto

ARG JAR_FILE=target/*.jar

ENV BOT_NAME=bot_name
ENV BOT_TOKEN=bot_token
ENV BOT_DB_USERNAME=jrtb_db_user
ENV BOT_DB_PASSWORD=jrtb_db_password

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java", "-Dspring.datasource.password=${BOT_DB_PASSWORD}", "-Dspring.datasource.username=${BOT_DB_USERNAME}", "-Dbot.username=${BOT_NAME}", "-Dbot.token=${BOT_TOKEN}", "-jar", "/app.jar"]