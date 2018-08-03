FROM node:6 as build
WORKDIR /tmp
COPY package.json yarn.lock /tmp/
RUN yarn --pure-lockfile

FROM node:6-slim
WORKDIR /srv/oauth
RUN groupadd -r kickbox && \
    useradd -r -g kickbox kickbox && \
    chown -R kickbox:kickbox /srv/oauth

# Install CoffeeScript
RUN yarn global add coffeescript@1.10.0
USER kickbox
COPY --chown=kickbox --from=build /tmp /srv/oauth
COPY --chown=kickbox . /srv/oauth/
RUN npm run grunt

CMD ["./node_modules/.bin/coffee", "/srv/oauth/lib/oauthd.coffee"]
