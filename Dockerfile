FROM ubuntu:bionic-20190204

RUN apt-get update && apt-get install -y python3.6 curl=7.58.0-2ubuntu3.6

RUN apt-get update && apt-get install -y python3-distutils

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py

COPY requirements.txt /

RUN python3 -m pip install -r requirements.txt

COPY docker-entrypoint.sh /locust/

WORKDIR /locust/

EXPOSE 8089 5557 5558

ENTRYPOINT ["/bin/bash"]

CMD ["./docker-entrypoint.sh"]