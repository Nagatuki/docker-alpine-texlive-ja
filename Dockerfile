# Copyright (c) 2016 Kaito Udagawa
# Copyright (c) 2016-2020 3846masa
# Copyright (c) 2020 Nagatuki
# Released under the MIT license
# https://opensource.org/licenses/MIT

FROM frolvlad/alpine-glibc:latest

ENV PATH /usr/local/texlive/2020/bin/x86_64-linuxmusl:$PATH
ENV HOME="/home/LaTeX"

RUN apk add --no-cache curl perl fontconfig-dev freetype-dev
RUN apk add --no-cache --virtual .fetch-deps xz tar wget

RUN mkdir /tmp/install-tl-unx && \
    curl -L ftp://tug.org/historic/systems/texlive/2020/install-tl-unx.tar.gz | \
      tar -xz -C /tmp/install-tl-unx --strip-components=1 && \
    printf "%s\n" \
      "selected_scheme scheme-basic" \
      "tlpdbopt_install_docfiles 0" \
      "tlpdbopt_install_srcfiles 0" \
      > /tmp/install-tl-unx/texlive.profile && \
    /tmp/install-tl-unx/install-tl \
      --profile=/tmp/install-tl-unx/texlive.profile && \
    tlmgr install \
      collection-latexextra \
      collection-fontsrecommended \
      collection-langjapanese \
      chemgreek \
      mhchem \
      siunitx \
      latexmk && \
    rm -fr /tmp/install-tl-unx && \
    apk del .fetch-deps

RUN mkdir ${HOME}
COPY ./.latexmkrc ${HOME}

WORKDIR /workdir

CMD ["sh"]
