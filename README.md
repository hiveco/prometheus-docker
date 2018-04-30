# Prometheus in a Container

Source code for [hiveco/prometheus](https://hub.docker.com/r/hiveco/prometheus). This image is designed to be an extremely thin wrapper around the official `prom/prometheus` image, providing support for supplying command line arguments in environment variables. See [#504](https://github.com/prometheus/alertmanager/issues/504) for details on why the Prometheus authors chose not to include this functionality in the official image.

Environment variables given to `docker run` that are prefixed with `PROM_` are converted into command line arguments to Prometheus. Underscores are converted to periods and double-underscores to dashes.

Examples:

* To set `--log.level=error`, add the option `-e PROM_LOG_LEVEL=error`
* To set `--web.external-url=http://localhost`, add the option `-e PROM_WEB_EXTERNAL__URL=http://localhost`.

See also [hiveco/alertmanager](https://hub.docker.com/r/hiveco/alertmanager), the Alertmanager sister image to this one.

> Another project by [Hive Collective](http://hivecollective.co). *DevOps-on-Demand, so you can focus on shipping features.*
