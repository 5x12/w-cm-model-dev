FROM python:3.8

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
         libicu-dev \
         libyaml-dev \
         libmariadb-dev-compat \
         libmariadb-dev \
         pkg-config \
         g++ \
         git \
         gcc \
         build-essential \
         python3-dev \
         unixodbc-dev \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install -U pip

COPY ./requirements.txt /tmp/

RUN cd /tmp \
  && pip install -r requirements.txt

WORKDIR /app
COPY utils /app/utils


CMD ["python', "model.py"]


