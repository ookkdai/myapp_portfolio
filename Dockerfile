FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN mkdir /myapp_portfolio
WORKDIR /myapp_portfolio
COPY Gemfile /myapp_portfolio/Gemfile
COPY Gemfile.lock /myapp_portfolio/Gemfile.lock
RUN bundle install
COPY . /myapp_portfolio

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn postgresql-client