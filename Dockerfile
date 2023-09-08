FROM mcr.microsoft.com/devcontainers/base:jammy

# Set the environment variables for non-interactive apt-get installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install required packages
RUN apt-get update && \
    apt-get -y install python-is-python3 python3-pip libgl1-mesa-glx libxrender1 xvfb git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install the requirement packages
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt
RUN rm -rf /tmp/requirements.txt


CMD echo "Hello Johan"
