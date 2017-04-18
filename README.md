# fake-s3 [![Build Status](https://travis-ci.org/mkubenka/docker-fake-s3.svg?branch=master)](https://travis-ci.org/mkubenka/docker-fake-s3)

> Inpired by: https://github.com/wallneradam/docker-fake-s3-alpine

Minimal Fake S3 + AWS CLI Docker image based on Alpine linux.

It is a minimal Docker image from the [fake-s3](https://github.com/jubos/fake-s3) project.
Uses a persistent volume in /opt/fakes3/data to store persistence data.

## Usage

```bash
docker run --rm -d mkubenka/fake-s3
```

## Environment Variables

### `FAKES3_PORT`

Default port is `4569`.

Changing port:

```bash
docker run --rm -d -p 10000 -e "FAKES3_PORT=10000" mkubenka/fake-s3
```

### `FAKES3_DEFAULT_BUCKET`

Default bucket is `fake`.

```bash
docker run --rm -d -e "FAKES3_DEFAULT_BUCKET=real" mkubenka/fake-s3
```
