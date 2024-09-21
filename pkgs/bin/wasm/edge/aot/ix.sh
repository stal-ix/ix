{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wasm/edge/aot/unwrap(libfmt_ver=10)
{% endblock %}

