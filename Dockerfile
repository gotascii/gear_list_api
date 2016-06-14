FROM ruby:2.3.0
MAINTAINER Justin Marney <gotascii@gmail.com>

RUN apt-get update
RUN apt-get install -y --force-yes build-essential sqlite3 libsqlite3-dev

EXPOSE 3000

RUN useradd -ms /bin/bash gotascii

RUN mkdir -p /opt/gear_list_api
RUN chown gotascii:gotascii /opt/gear_list_api

WORKDIR /opt/gear_list_api

# Copy app such that container runs w/o mounted volume.
# When mounting local volume, /opt/gear_list is shadowed.
COPY . ./
RUN chown -R gotascii:gotascii \.* *

COPY Gemfile Gemfile.lock ./
RUN chown gotascii:gotascii Gemfile*

USER gotascii
RUN gem install bundler
RUN bundle install --path=vendor/bundle --jobs 20 --retry 5

ENV PORT 3000
ENV RACK_ENV development

CMD rm -rf tmp/pids/* && bundle exec puma -t 5:5 -p ${PORT} -e ${RACK_ENV}
