FROM node:6 as build
WORKDIR /tmp
COPY package.json yarn.lock /tmp/
RUN yarn --pure-lockfile

FROM node:6-slim
ARG CONFIG_FILE_PATH

WORKDIR /srv/oauth
# Install CoffeeScript
RUN yarn global add coffeescript@1.10.0
COPY --from=build /tmp /srv/oauth
COPY . /srv/oauth/

# Copy config file, pass the file name
COPY $CONFIG_FILE_PATH /srv/oauth
RUN npm run grunt

EXPOSE 3001

RUN cd /srv/oauth/
CMD ["./node_modules/.bin/coffee", "lib/oauthd.coffee"]
