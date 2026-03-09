FROM ruby:3.4.7

WORKDIR /code

COPY Gemfile Gemfile.lock app.rb ./

RUN bundle install

# SHELL MODE
#CMD ruby app.rb -o 0.0.0.0
#USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
#root           1  0.0  0.0   2680  1112 ?        Ss   15:44   0:00 /bin/sh -c ruby app.rb -o 0.0.0.0
#root           7  1.7  0.2 762780 33024 ?        Sl   15:44   0:00 puma 7.2.0 (tcp://0.0.0.0:4567) [code]

# EXEC MODE
CMD ["ruby", "app.rb", "-o", "0.0.0.0"]
#USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
#root           1  0.0  0.2 762756 33308 ?        Ssl  15:45   0:00 puma 7.2.0 (tcp://0.0.0.0:4567) [code]