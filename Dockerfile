FROM codercom/code-server:v2

USER root
RUN apt-get update
RUN apt-get install -y --fix-missing unzip python3.6 python3-pip
RUN pip3 install jupyter

USER coder

# install flutter 
ENV FLUTTER_ROOT="/home/coder/flutter"
ENV FLUTTER_VERSION="v1.9.1+hotfix.4"
RUN git clone --branch $FLUTTER_VERSION https://github.com/flutter/flutter "${FLUTTER_ROOT}"
ENV PATH="${FLUTTER_ROOT}/bin:${PATH}"
# switch to the tip of tree channel; also enable flutter web
RUN flutter channel master
RUN flutter upgrade 
RUN flutter config --enable-web


# persistent flutter so users don't lose updates
VOLUME /home/coder/flutter



