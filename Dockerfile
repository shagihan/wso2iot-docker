FROM ubuntu:16.04

# Arguments
ARG IOT_VERSION=3.3.0
ARG JDK=jdk1.8.0_161

COPY ./files/wso2iot-${IOT_VERSION}.zip /wso2/
COPY ./files/${JDK}.zip /wso2/
COPY ./files/build.sh /wso2/

RUN apt-get update 
RUN apt-get install zip -y
RUN unzip /wso2/${JDK}.zip -d /wso2 \
    && rm /wso2/${JDK}.zip \
    && unzip /wso2/wso2iot-${IOT_VERSION}.zip -d /wso2 \
    && rm /wso2/wso2iot-${IOT_VERSION}.zip

ENV JAVA_HOME /wso2/${JDK}
ENV WORKING_DIRECTORY=/wso2/wso2iot-${IOT_VERSION}/bin
ENV BUILD_DIRECTORY=/wso2/

RUN chmod 777 ${BUILD_DIRECTORY}build.sh
ENTRYPOINT ${BUILD_DIRECTORY}build.sh
EXPOSE 9443 9763 8243 8280 10397 7711