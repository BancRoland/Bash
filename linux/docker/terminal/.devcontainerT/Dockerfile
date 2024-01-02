FROM python:3.11 as build
  
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends build-essential cmake fish ssh

ARG FLATB_VER=23.5.26  #23.1.21
RUN cd /home && wget https://github.com/google/flatbuffers/archive/refs/tags/v${FLATB_VER}.tar.gz \
    && tar -xvzf v${FLATB_VER}.tar.gz \
    && cd flatbuffers-${FLATB_VER} \
    && mkdir -p build \
    && cd build \
    && CXXFLAGS="-Wno-error=class-memaccess" cmake .. \
    && make -j8 \
    && make install \
    && cd /home \
    && rm -rf flatbuffers-${FLATB_VER}

RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan 10.97.27.33 >> ~/.ssh/known_hosts

RUN apt-get install nano

RUN cd /
RUN --mount=type=ssh git clone git@10.97.27.33:pornekia/simrad_com.git
RUN cd /simrad_com/ && git checkout 08666693b466b59f22e6880dc215bfb60da989bf

RUN pip install zmq
RUN pip install numpy
RUN pip install flatbuffers
RUN pip install pyserial
RUN pip install deprecated

RUN cd /
RUN --mount=type=ssh git clone git@10.97.27.33:pointer/protocol_serializer.git
RUN cd /protocol_serializer/ && git checkout cc2b595fc35234b9c669a281bee80a0a57e2d6be && pip install -e .

RUN cd /
RUN --mount=type=ssh git clone git@10.97.27.33:mbr/protocol_mbr_hl.git
RUN cd /protocol_mbr_hl/ && git checkout 09ddb981cf8dbf1e89b0a110da8c5d97267b9ba8

RUN cd /
RUN git clone https://github.com/google/flatbuffers.git && cd flatbuffers && cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release && make && make install && ldconfig
RUN cd /simrad_com && flatc -p /protocol_mbr_hl/opumessages.fbs
RUN cd /simrad_com/ZeroMQServer && flatc -p /protocol_mbr_hl/opumessages.fbs

WORKDIR /simrad_com
CMD ["/bin/bash"]

# SHELL ["fish", "--command"]

# RUN chsh -s /usr/bin/fish

# ENV SHELL /usr/bin/fish
# ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8

# ENTRYPOINT [ "fish" ]


# ARG USERNAME
# ARG USER_UID
# ARG USER_GID=$USER_UID

# # Create the user
# RUN groupadd --gid $USER_GID $USERNAME \
#     && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME 
#     #
#     # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
# RUN apt-get update \
# && apt-get install -y sudo \
# && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
# && chmod 0440 /etc/sudoers.d/$USERNAME \
# && echo $USERNAME:$USERNAME  | chpasswd


# # [Optional] Set the default user. Omit if you want to keep the default as root.
# USER $USERNAME

# ENV PATH="${PATH}:/home/${USERNAME}/.local/bin"
