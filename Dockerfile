FROM java:8

# Arguments
ARG IOT_VERSION=3.1.0

COPY ./files/wso2iot-${IOT_VERSION}.zip /temp/
COPY ./files/begin.sh /temp/
RUN apt-get update && apt-get install zip && \
    unzip /temp/wso2iot-${IOT_VERSION}.zip -d /temp

EXPOSE 9443 9763 8243 8280 10397 7711
WORKDIR /temp
RUN pwd
RUN rm ./wso2iot-${IOT_VERSION}.zip

CMD ["sh","begin.sh"]