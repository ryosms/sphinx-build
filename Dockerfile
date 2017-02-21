FROM python:3.6

RUN apt-get update \
    && apt-get install -y gettext graphviz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN pip install -U setuptools pip
RUN mkdir -p /doc/docs
WORKDIR /doc
COPY ./requirements.txt /doc/requirements.txt
RUN pip install sphinx && pip install -r /doc/requirements.txt

CMD bash