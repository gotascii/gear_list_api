FROM ruby:2.3.0
MAINTAINER Justin Marney <gotascii@gmail.com>

RUN apt-get update
RUN apt-get install -y --force-yes build-essential sqlite3 libsqlite3-dev

EXPOSE 3000

RUN mkdir -p /opt/gear_list
WORKDIR /opt/gear_list

RUN useradd -ms /bin/bash gotascii
RUN chown gotascii:gotascii /opt/gear_list

COPY Gemfile Gemfile.lock ./
RUN chown gotascii:gotascii \.* *

USER gotascii
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5

# Copy app such that container runs w/o mounted volume.
# When mounting local volume, /opt/gear_list is shadowed.
COPY . ./
USER root
RUN chown -R gotascii:gotascii \.* *

USER gotascii

CMD ["rails", "server", "-b", "0.0.0.0"]
