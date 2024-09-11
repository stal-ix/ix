{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/git/unwrap(libcurl_ver=http1)
{% endblock %}
