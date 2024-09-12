# docker image build -t doqer:test_1 .
# docker container run --rm doqer:test_1

# Il container viene eseguito e poi muore.

FROM ruby:3.1.1-alpine

COPY hello.rb .

CMD ["ruby", "hello.rb"]