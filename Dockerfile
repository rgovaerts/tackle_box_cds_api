FROM elixir:1.11.4-alpine

RUN mix local.hex --force && mix local.rebar --force

RUN mix archive.install hex phx_new --force

WORKDIR /app
EXPOSE 4000