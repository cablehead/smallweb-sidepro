FROM denoland/deno:1.46.1

RUN apt-get update \
    && apt-get install -y curl vim \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

# note: version is unpinned and will get the latest version
RUN curl -fsSL 'https://install.smallweb.run?target_dir=/usr/local/bin' | sh

RUN useradd -m -s /bin/bash smallweb
RUN chown smallweb:smallweb /home/smallweb

WORKDIR /home/smallweb
USER smallweb

# change this to your domain
ENV SMALLWEB_DOMAIN=smallweb.ndyg.co
ENV SMALLWEB_DIR=/home/smallweb/smallweb
ENV SMALLWEB_HOST=0.0.0.0
ENV SMALLWEB_PORT=8080

ENTRYPOINT [ "/usr/local/bin/smallweb", "up" ]
