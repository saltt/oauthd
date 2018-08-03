FROM node:6 as build
WORKDIR /tmp
COPY package.json yarn.lock /tmp/
RUN yarn --pure-lockfile

FROM node:6-slim
WORKDIR /srv/oauth
# Install CoffeeScript
RUN yarn global add coffeescript@1.10.0
COPY --from=build /tmp /srv/oauth
COPY . /srv/oauth/
RUN npm run grunt
RUN groupadd -r kickbox && \
    useradd -r -g kickbox kickbox && \
    chown -R kickbox:kickbox /srv/oauth
USER kickbox

CMD ["./node_modules/.bin/coffee", "/srv/oauth/lib/oauthd.coffee"]
