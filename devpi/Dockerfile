FROM python:3.8.14-slim
MAINTAINER Webrepublic Engineering <tech@webrepublic.com>

# Set environment variables.
# https://stackoverflow.com/q/59812009
ENV PYTHONUNBUFFERED=1

# Update software.
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN python -m pip install --upgrade pip

# Create the folder where the devpi data (e.g. the indices) are saved.
RUN mkdir -p /devpi/server

# Set the current working directory inside the container.
WORKDIR devpi

# Copy files into /devpi.
ADD requirements.txt .

# Install devpi dependencies.
RUN pip install -r requirements.txt

# Initialize new devpi-server instance and set the serverdir to /devpi/server.
# https://devpi.net/docs/devpi/devpi/latest/+d/quickstart-server.html#installing-devpi-server-and-client
RUN devpi-init --serverdir /devpi/server

# The container listens on this port at runtime.
EXPOSE 4040

CMD ["devpi-server", \
     "--host", "0.0.0.0", \
     "--port", "4040", \
     "--serverdir", "/devpi/server", \
     # Only root can create other users and their indices.
     "--restrict-modify", "root"]
