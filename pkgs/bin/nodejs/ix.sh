{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/nodejs/unwrap(libopenssl_ver=3/quic,libcplpl_ver=18)
{% endblock %}
