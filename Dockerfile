FROM python:2.7

# lets use Bash so our Source is not a "."
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ADD https://bootstrap.pypa.io/get-pip.py /tmp/get-pip.py
RUN python /tmp/get-pip.py
RUN pip install --upgrade pip


RUN pip install virtualenv
RUN pip install virtualenvwrapper

ENV WORKON_HOME ~/.virtualenvs/jenkins
RUN mkdir -p $WORKON_HOME

RUN virtualenv ~/.virtualenvs/jenkins
RUN source ~/.virtualenvs/jenkins/bin/activate
RUN pip install jenkins-job-builder

# Really want a shell here, this command will exit, the docker run in the readme will provide the shell.
RUN /bin/bash 
