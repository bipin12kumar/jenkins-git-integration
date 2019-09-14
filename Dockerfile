FROM tomcat:8.0.51-jre8-alpine
RUN apk update && apk add wget && apk add jq && apk add curl && mkdir /etc/vyom
#ARG ENV_PROFILE
#ENV ENV_PROFILE=$ENV_PROFILE
#ENV CATALINA_OPTS -Dspring.profiles.active=ENV_PROFILE -Xmx350m -XX:+UseConcMarkSweepGC
RUN ["rm", "-rf", "/usr/local/tomcat/webapps/ROOT"]
COPY ./target/jenkins-git-integration.war /usr/local/tomcat/webapps/ROOT.war


CMD ["catalina.sh" , "run"]
