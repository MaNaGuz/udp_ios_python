FROM alpine

RUN apk add --no-cache python3 py3-pip

RUN python3 -m venv /venv

ENV PATH="/venv/bin:$PATH" 

WORKDIR /opt/udp_receiver

COPY config/ /opt/udp_receiver/config
COPY py/ /opt/udp_receiver/py
COPY scripts/start.sh /opt/udp_receiver/scripts/start.sh

RUN pip install -r config/requirements.txt

CMD ["sh", "scripts/start.sh"]