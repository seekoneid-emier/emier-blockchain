# Build stage
FROM rust:1.70-slim as builder

WORKDIR /app

# Copy source code
COPY . .

# Build the application
RUN cargo build --release --bins

# Runtime stage
FROM debian:bookworm-slim

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy binaries from builder stage
COPY --from=builder /app/target/release/emier-node /app/
COPY --from=builder /app/target/release/emier-cli /app/
COPY --from=builder /app/target/release/emier-dev /app/
COPY --from=builder /app/target/release/emier-benchmark /app/

# Create non-root user
RUN useradd -m -u 1000 emier
USER emier

# Default command
CMD ["./emier-node"]

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD ./emier-cli --version || exit 1
