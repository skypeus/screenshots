FROM node:8.14.0@sha256:dd2381fe1f68df03a058094097886cd96b24a47724ff5a588b90921f13e875b7

COPY package.json /app/
COPY build/server /app/build/server
COPY build/static /app/build/static
COPY build/shared /app/build/shared
COPY node_modules /app/node_modules
COPY bin/_run-docker /app/bin/
COPY build/screenshots.xpi /app/build/xpi/screenshots.xpi
RUN cd app && npm install
ENV NODE_ENV ${NODE_ENV:-production}

CMD /app/bin/_run-docker
