# Nagatuki/alpine-texlive-ja

<!-- [![Docker Automated build](https://img.shields.io/docker/automated/paperist/alpine-texlive-ja.svg)](https://hub.docker.com/r/paperist/alpine-texlive-ja/) -->
<!-- [![Docker Image Size](https://images.microbadger.com/badges/image/paperist/alpine-texlive-ja.svg)](https://microbadger.com/images/paperist/alpine-texlive-ja "Get your own image badge on microbadger.com") -->
<!-- [![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg)](https://github.com/RichardLitt/standard-readme) -->

> Minimal TeX Live image for Japanese based on alpine

Clone from [Paperist/docker-alpine-texlive-ja](https://github.com/Paperist/docker-alpine-texlive-ja) \(under the MIT License\).

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [License](#license)

## Install

Clone or download this repository and run a following command to build a docker image.

```bash
docker build -t nagatuki/latex .
```

## Usage

### Launch a container

```
docker run --rm -itd -v ${PWD}:/workdir --name latex nagatuki/latex
```

### Generate a pdf file

- Operating from outside a container 
(The last command is for removing unwanted intermediate files.)

```bash
docker exec latex latexmk [file_name]
docker exec latex latexmk -c [file_name]
```

- Operating from inside a container 
(The last command is for removing unwanted intermediate files.)

```bash
docker exec -it latex sh
latexmk [file_name]
latexmk -c [file_name]
```

### Stop a container

```
docker stop latex
```

## Additional Font

## License

MIT © Nagatuki
