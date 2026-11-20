FROM ubuntu:26.04

RUN apt-get update && apt-get install -y \
    curl \
    git \
    bash \
    build-essential \
    ca-certificates \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Install Cursor CLI (cursor-agent)
# The official installation script places binaries under ~/.local/bin
RUN curl https://cursor.com/install -fsS | bash

# Add Cursor CLI to PATH (usually installed at ~/.local/bin)
ENV PATH="/root/.local/bin:$PATH"

# Download and install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

RUN uv python install --default

# Install NVM (Node Version Manager) and a default Node.js version
ENV NVM_VERSION="0.40.8"
ENV NVM_DIR="${HOME:-/root}/.nvm"
ENV NODE_VERSION="24.22.1"

# Download and install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash

# install node
RUN bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION"

#RUN git clone https://github.com/o11y-dev/opentelemetry-hooks.git /root/opentelemetry-hooks
#RUN cd /root/opentelemetry-hooks && ./setup.sh --cursor --global
RUN uv tool install opentelemetry-hooks 
RUN otel-hook setup --agent cursor --global
RUN mkdir -p /root/.local/share/opentelemetry-hooks

COPY --chmod=+x ./hook-scripts/*.sh /root/.cursor/hooks/

# Set a working directory
WORKDIR /my-project

# Default command to verify installations
CMD ["bash"]