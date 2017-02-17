# telegraf-build-scripts
## Scripts for building SignalFx's Telegraf Agent

1. Checkout this repository
2. `cd` into the directory of the platform you wish to build on
3. Build the docker image `docker build -t "telegraf_builder" . `
4. Checkout the signalfx/telegraf fork (make sure you're on the `signalfx-integration` branch)
5. Run the container and mount in the repository and the output directory \
`docker run -ti -v <path to repository>:/src -v <path to this directory>/output:/output telegraf_builder`
6. Retrieve the the zip file containing the telegraf binary