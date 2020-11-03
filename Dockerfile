FROM alpine:3.12
RUN apk add -U --no-cache ca-certificates

COPY ./build/tenderseed /usr/bin/tenderseed
EXPOSE 26656

CMD ["/usr/bin/tenderseed", "start"]
