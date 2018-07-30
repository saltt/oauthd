FROM node:6
ARG CONFIG_FILE_PATH
EXPOSE 3001

# Install CoffeeScript
RUN yarn global add coffeescript@1.10.0

WORKDIR /srv/oauth
COPY package.json yarn.lock /srv/oauth/
RUN yarn --pure-lockfile

COPY . /srv/oauth/

# Copy config file, pass the file name
COPY $CONFIG_FILE_PATH /srv/oauth
RUN npm run grunt

RUN cd /srv/oauth/
CMD ["./node_modules/.bin/coffee", "lib/oauthd.coffee"]
