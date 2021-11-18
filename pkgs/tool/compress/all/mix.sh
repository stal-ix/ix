{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
tool/compress/bsdtar/mix.sh
tool/compress/bzip2/mix.sh
tool/compress/gzip/mix.sh
tool/compress/lzip/mix.sh
tool/compress/minigzip/mix.sh
tool/compress/p7zip/mix.sh
tool/compress/unrar/mix.sh
tool/compress/unzip/mix.sh
tool/compress/upx/mix.sh
tool/compress/xz/mix.sh
tool/compress/zip/mix.sh
{% endblock %}
