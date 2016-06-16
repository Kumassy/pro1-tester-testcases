FROM ruby:2.3.1
RUN gem install rspec

RUN mkdir /app
# ADD . /app
# CMD ["rspec", "/app/tester.rb", "--color"]


# docker build -t my-ruby-image .
# docker run -it --rm -v "$PWD":/app/ -w /app/ my-ruby-image rspec tester.rb --color
