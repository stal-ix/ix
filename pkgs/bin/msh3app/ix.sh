{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/msh3app/unwrap(libopenssl_ver=3/quic)
{% endblock %}
