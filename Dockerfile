FROM alpine:latest

RUN apk add wget

WORKDIR /wiremock

RUN ["wget", "https://raw.githubusercontent.com/jeffersonsc/gozenviamock/release/bin/gozenviamock"]
RUN chmod +x gozenviamock

ENTRYPOINT [ "./gozenviamock", "server" ]
