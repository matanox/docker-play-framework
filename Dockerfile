# Following from http://www.massimochericoni.com/2015/02/27/how-to-run-a-java-program-in-a-docker-container/
# There will be some error benign messages, due to https://github.com/phusion/baseimage-docker/issues/58

FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install oracle-java8-installer -y
RUN apt-get install oracle-java8-set-default

#
# Following commented out code sets up and runs your play application in
# play framework's typical developer environment, typically not what you want.
#
# RUN apt-get install curl -y
# RUN apt-get install unzip -y
# RUN curl -O http://downloads.typesafe.com/typesafe-activator/1.3.7/typesafe-activator-1.3.7.zip
# RUN unzip typesafe-activator-1.3.7.zip -d / && rm typesafe-activator-1.3.7.zip && chmod a+x /activator-dist-1.3.7/activator
# ENV PATH $PATH:/activator-dist-1.3.7
# CMD ["activator", "run"]
# RUN mkdir /app
# WORKDIR /app
#

EXPOSE 9000

RUN mkdir /app
WORKDIR /app
