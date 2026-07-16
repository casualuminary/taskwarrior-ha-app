FROM alpine:latest

RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.20/main" > /etc/apk/repositories \
    && echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk --no-cache add \
        nodejs \
        npm \
        nginx \
        task3 \
        python3 \
        build-base

COPY ./frontend /src/frontend
COPY ./backend /src/backend

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/server.conf /etc/nginx/conf.d/default.conf

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENV TASKRC="/config/.taskrc"
ENV TASKDATA="/config/.task"

ENV NODE_OPTIONS="--openssl-legacy-provider"

RUN cd /src/frontend \
    && npm ci \
    && npm run build \
    && npm run export \
    && cp -r /src/frontend/dist /static \
    && rm -rf /src/frontend

RUN cd /src/backend \
    && npm ci \
    && npm run build \
    && npm prune --production \
    && rm -rf /src/backend/src

EXPOSE 80

CMD ["/run.sh"]