FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get -y install python3.7
RUN apt-get -y install python3-dev python3-pip
RUN python3 --version
RUN pip3 --version
RUN pip3 install --user --upgrade tensorflow==1.14
RUN pip3 install gpt-2-simple
RUN apt-get install -y curl
RUN apt-get install build-essential
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y --force-yes nodejs

WORKDIR /app
COPY generate.py /app/
COPY index.js /app/
COPY lib /app/lib
COPY package.json /app/
COPY package-lock.json /app/

RUN npm install --production
RUN npm i -g nodemon

ENV PYTHONIOENCODING=utf8

VOLUME [ "/app/models" ]
VOLUME [ "/app/checkpoint" ]

EXPOSE 8866

CMD nodemon lib/index.js