FROM denoland/deno:1.46.1

RUN apt-get update \
    && apt-get install -y curl vim \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

ARG SMALLWEB_VERSION=0.14.0-rc.1
RUN curl -fsSL 'https://install.smallweb.run?v=${SMALLWEB_VERSION}&target_dir=/usr/local/bin' | sh

# Create the smallweb user
RUN useradd -m -s /bin/bash smallweb

# Switch to the smallweb user
USER smallweb
WORKDIR /home/smallweb

# Copy a base Smallweb setup
COPY --chown=smallweb:smallweb smallweb smallweb

ENTRYPOINT [ "/usr/local/bin/smallweb", "up" ]
