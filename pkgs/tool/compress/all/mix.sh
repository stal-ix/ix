{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
lib/xz
lib/zstd
lib/bzip2
lib/brotli
lib/archive
tool/compress/gzip
tool/compress/lzip
tool/compress/p7zip
tool/compress/unrar
tool/compress/unzip
tool/compress/upx
tool/compress/zip
{% endblock %}
