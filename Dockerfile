FROM linuxserver/baseimage:latest

#prepare workdir
ENV WORKDIR /opt/jdownloader
RUN mkdir ${WORKDIR}
ENV PATH $PATH:/"${WORKDIR}"

#install java
RUN mkdir /opt/java && \
  curl -H "Cookie: oraclelicense=accept-securebackup-cookie" \
  -L "http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jre-8u102-linux-x64.tar.gz" | \
  tar xvz -C /opt/java --strip-components=1 && \
  update-alternatives --install "/usr/bin/java" "java" "/opt/java/bin/java" 1 && \
  update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/java/bin/javaws" 1 && \
  update-alternatives --set "java" "/opt/java/bin/java" && \
  update-alternatives --set "javaws" "/opt/java/bin/javaws"

# install jdownloader
RUN curl -L "http://installer.jdownloader.org/JDownloader.jar" -o ${WORKDIR}/JDownloader.jar && \
  java -Djava.awt.headless=true -jar ${WORKDIR}/JDownloader.jar

# clean
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# copy config, init and main script
COPY init/ /etc/my_init.d/
COPY services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh
