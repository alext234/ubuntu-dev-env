FROM codercom/code-server:v2

USER root
RUN apt-get update
RUN apt-get install -y --fix-missing unzip python3.6 python3-pip
RUN pip3 install jupyter

USER coder

# install flutter 
ENV FLUTTER_ROOT="/home/coder/flutter"
RUN git clone https://github.com/flutter/flutter "${FLUTTER_ROOT}"
ENV PATH="${FLUTTER_ROOT}/bin:${PATH}"
# switch to the tip of tree channel; also enable flutter web
RUN flutter channel master
RUN flutter config --enable-web
RUN flutter upgrade 
RUN flutter precache --web --no-android --no-ios


# persistent flutter so users don't lose updates
VOLUME /home/coder/flutter
