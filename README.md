# Cleaver Docker image source

This repo contains the scripts and files used to build the image to use [Cleaver](https://github.com/aschmelyun/cleaver) with Docker. These images are currently built with GitHub actions, and published to the [Docker Hub](https://hub.docker.com/r/aschmelyun/cleaver).

These are the current tags available:

- `aschmelyun/cleaver:latest` - The latest stable version of the Docker image

## Usage

Use this image to build your Cleaver site by following these steps:

- Install [Docker](https://docs.docker.com/get-docker/) if you haven't already
- Create a new Cleaver project with `git clone https://github.com/aschmelyun/cleaver.git .`
- In your project root, run `docker run --rm -v $(pwd):/var/www aschmelyun/cleaver`

After the build completes, the Docker image will be removed and you should now have a `dist` directory in your project folder containing the compiled assets for your site.

You can add `production` to the end of the `docker run` command to run PurgeCSS and minify the assets for production.
