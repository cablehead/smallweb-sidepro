FROM denoland/deno:1.46.1

RUN apt-get update \
    && apt-get install -y curl vim \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

# note: version is unpinned and will get the latest version
RUN curl -fsSL 'https://install.smallweb.run?target_dir=/usr/local/bin' | sh

# Create the smallweb user
RUN useradd -m -s /bin/bash smallweb

# Switch to the smallweb user
USER smallweb
WORKDIR /home/smallweb

# Change this to your smallweb repo
RUN mkdir -p smallweb \
    && curl -L https://github.com/cablehead/my-smallweb/archive/refs/heads/main.tar.gz \
    | gunzip \
    | tar -xC ./smallweb --strip-components=1

# Change this to your domain
ENV SMALLWEB_DOMAIN=smallweb.ndyg.co

ENV SMALLWEB_DIR=/home/smallweb/smallweb
ENV SMALLWEB_HOST=0.0.0.0
ENV SMALLWEB_PORT=8080

ENTRYPOINT [ "/usr/local/bin/smallweb", "up" ]
