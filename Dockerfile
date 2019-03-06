FROM ubuntu:bionic-20190204

RUN apt-get update && apt-get install -y \
                                      gcc=4:7.3.0-3ubuntu2.1 \
                                      libprotobuf-dev=3.0.0-9.1ubuntu1 \
                                      python3.6 \
                                      protobuf-compiler=3.0.0-9.1ubuntu1 \
                                      curl=7.58.0-2ubuntu3.6

RUN apt-get update && apt-get install -y python3-distutils && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.6 get-pip.py

COPY requirements.txt ./

RUN python3.6 -m pip install -r requirements.txt

COPY iroha/ /iroha/

COPY iroha/example/python/irohalib.py iroha/example/python/ed25519.py /test/load/

WORKDIR /iroha/example/python/

RUN protoc --proto_path=../../shared_model/schema --python_out=. ../../shared_model/schema/*.proto

RUN python3.6 -m grpc_tools.protoc --proto_path=../../shared_model/schema --python_out=. --grpc_python_out=. ../../shared_model/schema/endpoint.proto

EXPOSE 5557 5558

ENTRYPOINT ["locust"]

CMD ["-f my_locustfile.py", "--master"]