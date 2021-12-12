{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
lib/xz/mix.sh
lib/zstd/mix.sh
lib/bzip2/mix.sh
lib/brotli/mix.sh
lib/archive/mix.sh
tool/compress/gzip/mix.sh
tool/compress/lzip/mix.sh
tool/compress/p7zip/mix.sh
tool/compress/unrar/mix.sh
tool/compress/unzip/mix.sh
tool/compress/upx/mix.sh
tool/compress/zip/mix.sh
{% endblock %}
