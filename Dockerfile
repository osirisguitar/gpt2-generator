FROM ubuntu:20.04

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN apt-get -y install python3-dev python3-pip
RUN pip3 install --user --upgrade tensorflow-gpu
RUN pip3 install tqdm regex toposort
RUN apt-get install -y curl
RUN apt-get install build-essential
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y --force-yes nodejs

WORKDIR /app
RUN curl -OL https://github.com/YaleDHLab/gpt-2-simple/archive/refs/heads/master.zip
RUN apt-get -y install unzip
RUN unzip master.zip
RUN rm master.zip
RUN mv gpt-2-simple-master/gpt_2_simple /app/
COPY generate.py /app/
COPY index.js /app/
COPY lib /app/lib
COPY package.json /app/
COPY package-lock.json /app/

RUN npm install --production
RUN npm i -g nodemon

ENV PYTHONIOENCODING=utf8

VOLUME [ "/app/checkpoint" ]

EXPOSE 8866

CMD nodemon lib/index.js