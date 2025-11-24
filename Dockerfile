FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y curl gnupg lsb-release iproute2
COPY src/wsl.conf /etc/wsl.conf

# Install k0s
RUN curl -sSLf https://get.k0s.sh | sh

# Optional: create a non-root user
RUN useradd -ms /bin/bash devuser
USER devuser
WORKDIR /home/devuser

# Now the magic begins
CMD ["k0s", "controller", "--single", "--enable-worker", "--no-taints"]