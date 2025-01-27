{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/nodejs/unwrap(libopenssl_ver=3/quic,libc_lite=1)
{% endblock %}
