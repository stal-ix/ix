{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mrustc/cargo/unwrap(libopenssl_ver=1)
{% endblock %}
