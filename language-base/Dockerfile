FROM ubuntu


RUN apt update
RUN apt install -y wget
RUN apt install -y curl

## python install
#RUN wget $PYTHON_URL
#RUN tar -xvzf Python-$PYTHON_VERSION.tgz && rm Python-$PYTHON_VERSION.tgz
#RUN /Python-$PYTHON_VERSION/configure --enable-optimizations
#RUN make altinstall
#RUN ln -s /usr/local/bin/python3.7 /usr/bin/python3
#RUN ln -s /usr/local/bin/python3.7 /usr/bin/python

# java install
ENV JAVA_URL=https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
RUN wget $JAVA_URL
RUN tar -xvzf openjdk-11.0.2_linux-x64_bin.tar.gz && rm openjdk-11.0.2_linux-x64_bin.tar.gz
RUN mkdir -p  /usr/lib/jvm \
                 && mv jdk-11.0.2 /usr/lib/jvm/
RUN ln -s /usr/lib/jvm/jdk-11.0.2 /usr/lib/jvm/jdk
ENV JAVA_HOME=/usr/lib/jvm/jdk
ENV CLASS_PATH=.:$JAVA_HOME/lib/tools.jar
ENV PATH=$PATH:$HOME/bin:$JAVA_HOME/bin


