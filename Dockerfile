FROM codercom/code-server:v2

# install flutter 
ENV FLUTTER_ROOT="/home/coder/flutter"
ENV FLUTTER_VERSION="v1.9.1+hotfix.4"
RUN git clone --branch $FLUTTER_VERSION https://github.com/flutter/flutter "${FLUTTER_ROOT}"
ENV PATH="${FLUTTER_ROOT}/bin:${PATH}"

USER root
RUN apt-get install -y --fix-missing unzip python3.6 python3-pip
RUN pip3 install jupyter

# persistent flutter so users don't lose updates
VOLUME /home/coder/flutter

USER coder


