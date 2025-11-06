{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/curl/ngtcp2/unwrap(libopenssl_ver=wolf,libssh2_ver=wolfssl,libcurl_no_fallback=1,libngtcp2_ver=wolfssl)
{% endblock %}
