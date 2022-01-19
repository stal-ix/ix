{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
lib/xz
lib/zstd
lib/bzip2
lib/brotli
lib/archive
bin/gzip
bin/lzip
bin/p7zip
bin/unrar
bin/unzip
bin/upx
bin/zip
{% endblock %}
