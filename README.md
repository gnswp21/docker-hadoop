# docker-hadoop

hadoop system을 docker container로 구축 및 테스트
ubuntu 이미지를 base로 단계별로 dockernize하여 필요한 이미지를 제작한다.

## version
HADOOP 3.3.6    
JAVA openjdk-11.0.2_linux-x64


## 정상작동 테스트

`docker exec -it namenode /bin/bash`
`start-all.sh`


`hadoop fs -put /opt/hadoop/LICENSE.txt /tmp/test/wordcount/`

`hadoop jar /opt/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.6.jar wordcount /tmp/test/wordcount /tmp/test/wordcount_out`

`hdfs fsck /tmp/test/wordcount_out -files -blocks -locations`

## 기존프로젝트와의 차이점
- 프로젝트 간소화 
  - 하둡 시스템 구조 변경
    - Resocure Manager가 네임노드와 같이 실행
    - zookeeper, spark shell ... 제거됨
    - MapReduce까지
- 하둡 버전 변경
- ssh 사용
  - start-dfs.sh 사용 가능
- 윈도우 호스트, 우분투 컨테이너 기반

---
### 출처 및 참고
Hadoop-ecosystem - Docker container로 구축해보기