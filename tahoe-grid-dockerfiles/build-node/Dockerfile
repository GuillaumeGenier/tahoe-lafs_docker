FROM alpine:edge as build
RUN apk --no-cache add build-base python3-dev py3-pip libffi-dev openssl-dev py3-setuptools
ENV PATH="/opt/venv/bin:/bin:$PATH"
RUN python3 -m venv /opt/venv
RUN /bin/sh -c 'pip3 install tahoe-lafs'

FROM alpine:edge
COPY --from=build /opt/venv/ /opt/venv/
RUN apk --no-cache add python3 py3-six py3-distro
ENV PATH="/opt/venv/bin:/bin:$PATH"
RUN tahoe create-node --hostname=dummy_hostname /data

ENTRYPOINT ["tahoe", "run", "/data"]