FROM ruby:3.0.5
RUN apt-get update -qq \
&& apt-get install -y nodejs
ADD . /Rails-Docker
WORKDIR /Rails-Docker
RUN bundle install
EXPOSE 3000
CMD ["bash"]
