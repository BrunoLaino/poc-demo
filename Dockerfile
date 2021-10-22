FROM registry.access.redhat.com/ubi8/ubi-init

USER root

RUN yum -y upgrade && \
    yum -y install wget && \
    yum -y install iputils && \
    yum -y install nc

RUN yum -y install java-1.8.0-openjdk

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk  \
    PATH=/usr/lib/jvm/jre-1.8.0-openjdk/bin:$PATH \
    MANPATH="/usr/share/man:${MANPATH}" \
    JAVACONFDIRS="/etc/java${JAVACONFDIRS:+:}${JAVACONFDIRS:-}"

ADD /java.security //
RUN cp -f /java.security $JAVA_HOME/lib/security/java.security
RUN rm /java.security

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

VOLUME /oidigital/etc
VOLUME /oidigital/logs

ENTRYPOINT ["java","-jar","/app.jar"]