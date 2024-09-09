# Smallweb on SidePro

- [Smallweb](https://www.smallweb.run)
- [SidePro](https://docs.sidepro.cloud/)

To deploy:

```shell
APPNAME=ndyg-smallweb
DIGEST=sha256:9a39f2a5bdf2fac60943d1feeded9ed52527409dfe42490694f703847f0b8fb2

sidepro push \
    --name ndyg-smallweb \
    --container-image-url ghcr.io/cablehead/smallweb-sidepro@$DIGEST \
    --port 8080 \
    -r smallweb.ndyg.co -r www.smallweb.ndyg.co -r example.smallweb.ndyg.co
```

For now you need to enumerate the routes for your apps manually, but you should
be able to specify a wildcard route in the future.
