FROM ruby:2.7.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /spots
ADD . /spots
RUN bundle install

ENV CONTAINER_EXAMPLE_DATABASE_PASSWORD=password
EXPOSE 3000

CMD rm -f tmp/pids/server.pid && bin/rails db:create && bin/rails db:migrate && bin/rails server -b 0.0.0.0