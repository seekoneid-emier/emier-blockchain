FROM rust:1.70-slim as builder

WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /app/target/release/emier-node /app/
COPY --from=builder /app/target/release/emier-cli /app/

RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

CMD ["./emier-node"]
