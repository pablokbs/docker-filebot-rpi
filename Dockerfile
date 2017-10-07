FROM resin/rpi-raspbian:jessie

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install binutils xz-utils libjna-java mediainfo wget -y && \
    apt-get -t jessie-backports install openjdk-8-jdk-headless -y

RUN wget "https://sourceforge.net/projects/filebot/files/filebot/FileBot_4.7.7/filebot_4.7.7_noarch.ipk/download"  -O /tmp/filebot_noarch.ipk && \
    cd /tmp && \
    ar -x filebot_noarch.ipk && \
    xz -d data.tar.xz && \
    tar xvf data.tar && \
    cp -rf opt/ /

RUN mkdir /tmp/jna-4.0.0 && cd /tmp/jna-4.0.0 && \
    wget --no-check-certificate https://maven.java.net/content/repositories/releases/net/java/dev/jna/jna/4.0.0/jna-4.0.0.jar https://maven.java.net/content/repositories/releases/net/java/dev/jna/jna-platform/4.0.0/jna-platform-4.0.0.jar && \
    jar xf jna-4.0.0.jar && \
    cp -p com/sun/jna/linux-arm/libjnidispatch.so /usr/lib/arm-linux-gnueabihf/jni/libjnidispatch_4.0.0.so && \
    cd /usr/lib/arm-linux-gnueabihf/jni/ && \
    mv libjnidispatch.so libjnidispatch_3.2.7.so && \
    ln -s libjnidispatch_4.0.0.so libjnidispatch.so && \
    cd /usr/share/java && \
    rm jna.jar && \
    cp /tmp/jna-4.0.0/*.jar . && \
    ln -s jna-4.0.0.jar jna.jar && \
    ln -s jna-platform-4.0.0.jar jna-platform.jar && \
    java -jar jna.jar

RUN cd /opt/share/filebot && \
    ln -s /usr/lib/arm-linux-gnueabihf/libmediainfo.so.0 libmediainfo.so && \
    ln -s /usr/lib/arm-linux-gnueabihf/libzen.so.0 libzen.so

ENTRYPOINT [ "/opt/share/filebot/filebot.sh" ]
