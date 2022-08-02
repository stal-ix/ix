{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/xz
bin/7z
bin/lz4
bin/zip
bin/tar
bin/gzip
bin/lzip
bin/zstd
bin/p7zip
bin/unrar
bin/unzip
bin/bzip2
bin/brotli
bin/bsdtar
bin/cabextract
{% endblock %}
