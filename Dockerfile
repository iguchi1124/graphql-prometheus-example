FROM ruby:2.7

RUN mkdir -p /app /log

WORKDIR /app

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

COPY package.json yarn.lock /app/
RUN yarn install

COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY . /app/

RUN ln -s /log ./log
RUN mkdir -p tmp

COPY docker/entrypoint.sh /usr/bin/
ENTRYPOINT ["entrypoint.sh"]
