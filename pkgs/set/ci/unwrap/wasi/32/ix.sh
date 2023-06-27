{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/lz4
bin/b64
bin/yajl
bin/base64
bin/brotli
{% endblock %}
