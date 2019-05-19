from python:3.7-slim

RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y build-essential wget

RUN echo "deb http://archive.raspberrypi.org/debian/ jessie main" >> /etc/apt/sources.list && \
	wget https://archive.raspberrypi.org/debian/raspberrypi.gpg.key -O - | apt-key add

RUN apt-get update && apt-get install -y libraspberrypi-bin

RUN python3 -m pip install pip --upgrade

RUN python3 -m pip install jupyter

RUN python3 -m pip install rainbowhat smbus

RUN mkdir /notebooks

CMD jupyter notebook --allow-root --no-browser --ip 0.0.0.0 --port 8888 /notebooks
