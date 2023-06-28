{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/lz4
bin/b64
bin/yajl
bin/zstd
bin/gperf
bin/getopt
bin/base64
bin/brotli
bin/giflib
bin/minised
bin/minigzip
{% endblock %}
