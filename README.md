# Smallweb on SidePro

This is a template for deploying a [Smallweb](https://www.smallweb.run)
installation on [SidePro](https://docs.sidepro.cloud/). I used
https://github.com/pomdtr/smallweb-fly as a reference.

## BYO domain name

To use this you'll need to have a domain name you can manage. Point the DNS for
the root domain you'd like to use to SidePro's servers using [these
instructions](https://docs.sidepro.cloud/deploying-apps/?h=custom+domain#custom-domains-and-urls).
You'll want to point a wildcard subdomain as well, so you can create arbitrary
subdomains.

If you look at the
[`sidepro.yml`](https://github.com/cablehead/smallweb-sidepro/blob/main/sidepro.yml)
you'll see that you currently need to enumerate the routes for your apps
manually. This is so SidePro can generate a SSL cert for each one, but you
should be able to specify a wildcard route in the future.

## To deploy

Uses: [jo](https://github.com/jpmens/jo), [minijinja-cli](https://github.com/mitsuhiko/minijinja)

```shell
# replace with your own values
jo \
  SIDEPRO_APPLICATION_NAME=ndyg-smallweb \
  SMALLWEB_DOMAIN=smallweb.ndyg.co \
  SMALLWEB_SIDEPRO_IMAGE_DIGEST=sha256:27e1d3a5f5c02fd1421b3fb52daae6a6ceb9b78d5d66109d196858a20cf63066 \
  SIDEPRO_NAMESPACE=andy-beta | minijinja-cli --autoescape=none -f json ./sidepro.yml - > manifest.yml

sidepro push manifest.yml
```

