{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/curl/wolf/unwrap(libssh2_ver=wolfssl,libcurl_no_fallback=1)
{% endblock %}
