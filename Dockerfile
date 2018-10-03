# Ubuntu 16.04
# Oracle Java 1.8.0_181 64 bit
FROM ubuntu:16.04
#Please remove or change maintainer
MAINTAINER adsy411@gmail.com
# update dpkg repositories
RUN apt-get update 
# install wget
RUN apt-get install -y wget
# set shell variables for java installation
ENV java_version 1.8.0_181
ENV filename jdk-8u181-linux-x64.tar.gz
# download java, accepting the license agreement
RUN wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/${filename}

# unpack java
RUN mkdir /opt/java && tar -zxf /$filename -C /opt/java/
ENV JAVA_HOME /opt/java/jdk$java_version$java
ENV PATH $JAVA_HOME/bin:$PATH

# configure symbolic links for the java and javac executables
RUN update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 20000 && update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 20000

CMD ["bash"]

