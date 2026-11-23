FROM ruby:3.3-slim-trixie AS jekyll

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /site
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4
COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 4000
ENTRYPOINT ["bundle", "exec", "jekyll"]
CMD ["--help"]

FROM jekyll AS jekyll-serve
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000"]
