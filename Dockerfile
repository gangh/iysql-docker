FROM huajigang/soar

RUN apt-get update && \
    apt-get install -y python3

ENV PYTHON_PIP_VERSION 18.1

RUN wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py' && \
    python3 get-pip.py \
		--disable-pip-version-check \
		--no-cache-dir \
		"pip==$PYTHON_PIP_VERSION" ;

RUN mkdir -p /home/iysql && cd /home/iysql && \
    wget -O iysql_web.tar.gz 'https://github.com/gangh/iysql/archive/0.1.tar.gz' && \
    tar -xf iysql_web.tar.gz && \
    ls && \
    pip3 install -r iysql-0.1/requirments.txt 

RUN apt-get install -y netbase

CMD python3 /home/iysql/iysql-0.1/iysql/app.py

EXPOSE 5000
    

