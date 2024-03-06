FROM language-base

ENV HADOOP_VERSION=3.3.6
ENV HADOOP_FILE_NAME=hadoop-$HADOOP_VERSION
ENV HADOOP_URL=https://dlcdn.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/$HADOOP_FILE_NAME.tar.gz

# hadoop setting
WORKDIR /opt
RUN wget $HADOOP_URL
RUN tar -xvzf $HADOOP_FILE_NAME.tar.gz && rm $HADOOP_FILE_NAME.tar.gz

#RUN mv $HADOOP_FILE_NAME /opt
RUN ln -s /opt/$HADOOP_FILE_NAME /opt/hadoop
ENV HADOOP_HOME=/opt/hadoop

RUN ln -s $HADOOP_HOME/etc/hadoop /etc/hadoop
ENV HADOOP_CONF_DIR=/etc/hadoop

RUN mkdir $HADOOP_HOME/dfs
RUN rm -rf $HADOOP_HOME/share/doc
RUN mkdir -p $HADOOP_HOME/yarn/timeline

# copy hadoop config file
ADD core-site.xml $HADOOP_CONF_DIR
ADD yarn-site.xml $HADOOP_CONF_DIR
ADD mapred-site.xml $HADOOP_CONF_DIR

ADD hadoop-env.sh $HADOOP_CONF_DIR

ADD yarn-env.sh $HADOOP_CONF_DIR
ADD workers $HADOOP_CONF_DIR

# window to linux. CRLF -> LF
RUN sed -i 's/\r$//' $HADOOP_CONF_DIR/hadoop-env.sh
RUN sed -i 's/\r$//' $HADOOP_CONF_DIR/yarn-env.sh
RUN sed -i 's/\r$//' $HADOOP_CONF_DIR/workers


ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

ENV HADOOP_MAPRED_HOME=$HADOOP_HOME
ENV HADOOP_COMMON_HOME=$HADOOP_HOME
ENV HADOOP_HDFS_HOME=$HADOOP_HOME
ENV HADOOP_YARN_HOME=$HADOOP_HOME
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

ENV HDFS_NAMENODE_USER=root
ENV HDFS_DATANODE_USER=root
ENV HDFS_SECONDARYNAMENODE_USER=root
ENV YARN_RESOURCEMANAGER_USER=root
ENV YARN_NODEMANAGER_USER=root