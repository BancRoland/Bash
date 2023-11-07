FROM ubuntu:23.04

RUN apt-get update && apt-get install -y
RUN apt-get install -y rtl-sdr librtlsdr-dev

CMD ["/bin/bash"]


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
