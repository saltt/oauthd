FROM node:6 as build
WORKDIR /tmp
COPY package.json yarn.lock /tmp/
RUN yarn install --frozen-lockfile

FROM node:6-slim
WORKDIR /srv/oauth
RUN groupadd -r kickbox && \
    useradd -r -g kickbox kickbox && \
    chown -R kickbox:kickbox /srv/oauth

USER kickbox
COPY --chown=kickbox --from=build /tmp /srv/oauth
COPY --chown=kickbox . /srv/oauth/
RUN npm run grunt

CMD ["/usr/local/bin/yarn", "run", "server"]
