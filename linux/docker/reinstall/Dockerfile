FROM ubuntu:23.04

RUN apt-get update && apt-get install -y && apt-get install -y python3
RUN apt install -y git


# RUN mkdir /root/.ssh
# COPY .ssh /root/.ssh
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN --mount=type=ssh git clone git@github.com:BancRoland/reinstall.git


RUN mkdir Desktop && cd Desktop
# RUN git clone git@github.com:BancRoland/reinstall.git

# ## to use ping
# RUN apt-get install iputils-ping -y 
# # RUN apt install ssh

# # RUN ssh-keygen -f /root/.ssh/github -N ""
# # RUN pwd > /root/pwd.txt

# # COPY home/bancr/.ssh/id_ed25519 /root/.ssh
# COPY ~/.ssh/id_ed25519.pub /root/.ssh
# RUN git clone git@github.com:BancRoland/reinstall.git

# CMD ["/bin/bash"]

# # Use an official base image (e.g., Ubuntu, Alpine, CentOS, etc.)
# FROM ubuntu:20.04

# # Install any necessary packages
# RUN apt-get update && apt-get install -y \
#     package1 \
#     package2

# # Set environment variables (if needed)
# ENV MY_ENV_VAR=value

# # Copy files or directories into the container (if needed)
# COPY /local/path/to/files /container/path

# # Define the command to run when the container starts
# CMD ["command-to-run"]
