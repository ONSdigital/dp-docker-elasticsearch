FROM elasticsearch:5.2.2
ADD localData /usr/share/elasticsearch/data

COPY config ./config
