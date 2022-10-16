FROM ruby:3.0.4

RUN gem install bundler
ENV HOME /fetch
WORKDIR $HOME
ADD . .
RUN bundle install
ENTRYPOINT ["./fetch_cli/main.rb"]