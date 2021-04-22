FROM node:12-buster-slim
RUN npm config set proxy http://proxy.muc:8080
# Installing Oracle instant client
WORKDIR    /opt/oracle
RUN        yum install -y libaio1 wget unzip \
            && wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip \
            && unzip instantclient-basiclite-linuxx64.zip \
            && rm -f instantclient-basiclite-linuxx64.zip \
            && cd /opt/oracle/instantclient* \
            && rm -f *jdbc* *occi* *mysql* *README *jar uidrvci genezi adrci \
            && echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf \
            && ldconfig
RUN export LD_LIBRARY_PATH=/opt/oracle/instantclient_19_5
RUN export LD_LIBRARY_PATH=/opt/oracle/instantclient_19_5
RUN export ORACLE_HOME=/opt/oracle/instantclient_19_5

WORKDIR    /usr/src/app
COPY       . .  # Copy my project folder content into /app container directory

EXPOSE     8000
RUN npm install
CMD ["node", "index.js"]
