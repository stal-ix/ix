{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/curl/ngtcp2/unwrap(libopenssl_ver=aws,libngtcp2_ver=boringssl)
{% endblock %}
