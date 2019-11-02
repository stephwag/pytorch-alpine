FROM frolvlad/alpine-python-machinelearning
RUN echo "|--> Updating" \
    && apk update && apk add --no-cache git libexecinfo-dev linux-headers build-base cmake \
    && pip install --no-cache-dir pyyaml \
    && echo "|--> Install PyTorch" \
    && git clone --recursive https://github.com/pytorch/pytorch \
    && cd pytorch && python setup.py install \
    && echo "|--> Cleaning" \
    && rm -rf /pytorch \
    && rm -rf /root/.cache \
    && rm -rf /var/cache/apk/* \
    && apk del .build-deps \
    && find /usr/lib/python3.6 -name __pycache__ | xargs rm -r \
    && rm -rf /root/.[acpw]*
