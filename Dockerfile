FROM python:3

WORKDIR /mnt/

COPY requirements.txt ./

RUN apt-get update
RUN apt-get install -y ffmpeg

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install --no-cache-dir -r requirements.txt

COPY fetch_convert.sh /fetch_convert.sh
ENTRYPOINT [ "/fetch_convert.sh" ]
