

FROM alpine

RUN apk add python3 bash git gcc g++ python3-dev libffi-dev \
	&& pip3 install --upgrade pip

RUN \
	#
	# Clone the Twint source code so that we can modify it to 
	# remove references to Pandas.
	#
	git clone https://github.com/twintproject/twint.git \
	#
	# Now remove references to Pandas.
	# This may break some functionality, but it also reduces install time on
	# my 4-core i7 from like 15 minutes to more like 30 seconds, and since
	# my usecases don't currently touch Pandas, that's a win.
	#
	&& sed -i -e "s/'pandas', //" /twint/setup.py \
	&& sed -i -e "s/Pandas_au = True/Pandas_au = False/" /twint/twint/config.py \
	&& sed -i -e "s/import pandas as pd/pd = None/" /twint/twint/storage/panda.py \
	#
	# Now install Twint.
	#
	&& pip3 install -e /twint

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]


