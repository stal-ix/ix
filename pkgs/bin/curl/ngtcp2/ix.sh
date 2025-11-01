{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/curl/ngtcp2/unwrap(libopenssl_ver=3/quic,libngtcp2_ver=openssl)
{% endblock %}
