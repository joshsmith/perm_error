ARG ELIXIR_VERSION=1.14.2
ARG OTP_VERSION=25.2
ARG DEBIAN_VERSION=bullseye-20221004-slim

ARG BUILDER_IMAGE="hexpm/elixir:${ELIXIR_VERSION}-erlang-${OTP_VERSION}-debian-${DEBIAN_VERSION}"

FROM ${BUILDER_IMAGE}

WORKDIR /app

RUN mkdir -p /nonexistent
RUN chown nobody /app
RUN chown nobody /nonexistent
USER nobody

RUN mix local.hex --force && \
    mix local.rebar --force

COPY mix.exs mix.lock ./
RUN mix deps.get
RUN mix deps.compile

COPY config ./config
COPY lib ./lib
COPY perm_error.exs init.sh ./
RUN mix compile

CMD ["/app/init.sh"]
