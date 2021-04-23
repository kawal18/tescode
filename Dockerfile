FROM oraclelinux:7-slim
FROM node:10.16.3
RUN npm config set registry https://lpnexus01.bmwgroup.net:8088/repository/bmw_npm_repositories/
RUN npm config rm proxy
RUN npm config rm https-proxy
RUN npm install oracledb
RUN mkdir -p /opt/oracle
WORKDIR /opt/oracle
CMD ["pwd"]
ADD instantclient_19_5 /opt/oracle
RUN export LD_LIBRARY_PATH=/opt/oracle/instantclient_19_5
RUN export LD_LIBRARY_PATH=/opt/oracle/instantclient_19_5
RUN export ORACLE_HOME=/opt/oracle/instantclient_19_5
RUN cd /opt/oracle
