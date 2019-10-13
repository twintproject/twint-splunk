

FROM alpine

RUN apk add python3 bash
RUN pip3 install --upgrade pip

RUN apk add make automake gcc g++ python3-dev libffi-dev

RUN apk add git
RUN git clone https://github.com/twintproject/twint.git

RUN sed -i -e "s/'pandas', //" /twint/setup.py
RUN sed -i -e "s/Pandas_au = True/Pandas_au = False/" /twint/twint/config.py
RUN sed -i -e "s/import pandas as pd/pd = None/" /twint/twint/storage/panda.py

RUN pip3 install -e /twint

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]


