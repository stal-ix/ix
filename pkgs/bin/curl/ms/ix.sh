{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/curl/ms/unwrap(libopenssl_ver=3/quic)
{% endblock %}
