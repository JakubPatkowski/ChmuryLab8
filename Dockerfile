FROM node:21-alpine
ARG VERSION
ENV APP_VER=production.${VERSION:-v1.0}
RUN apk update && \
    apk upgrade --available && \
    apk add --no-cache libssl3=3.1.4-r6 && \
    mkdir -p /var/node
WORKDIR /var/node
ADD src ./
RUN npm install -g npm@latest
EXPOSE 3000
ENTRYPOINT [ "./bin/www" ]
