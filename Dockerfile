FROM ubuntu:14.04.5
MAINTAINER Telenium "github@telenium.ca"

# Install python development packages, and pip
RUN apt-get update -qy
RUN apt-get install -y python-dev python-pip

# Latest version of pip
RUN pip install --upgrade pip

# Install tox
RUN pip install tox

# Install pstree
RUN apt-get install -y psmisc

# Install PostgreSQL 9.3
RUN apt-get install -y postgresql-9.3 postgresql-server-dev-9.3

# Setup PostgreSQL test database
RUN sed -i -e 's/peer/trust/' /etc/postgresql/9.3/main/pg_hba.conf
RUN sed -i -e 's/md5/trust/' /etc/postgresql/9.3/main/pg_hba.conf
RUN service postgresql stop
