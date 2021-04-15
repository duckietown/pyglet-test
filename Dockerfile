# FROM nvidia/cuda:10.0-base
# FROM nvidia/cudagl:10.2-runtime-ubuntu18.04
FROM nvidia/opengl:1.2-glvnd-devel
WORKDIR /project
RUN vdir -a /tmp
RUN chmod go+w /tmp
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y python3-pip \
    python3-numpy python3-scipy \
    wget curl vim git 

RUN apt-get install freeglut3-dev -y

RUN pip3 install pyglet==1.5.15
# RUN apt-get install byobu python3-opencv -y

WORKDIR /project
COPY check.py .
CMD ["python3","check.py"]