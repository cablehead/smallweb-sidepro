# Smallweb on SidePro

This is a template for deploying a [Smallweb](https://www.smallweb.run)
app on [SidePro](https://docs.sidepro.cloud/). I used
https://github.com/pomdtr/smallweb-fly as a reference.

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

For now you need to enumerate the routes for your apps manually, so SidePro can
generate a SSL cert for each one, but you should be able to specify a wildcard
route in the future.
