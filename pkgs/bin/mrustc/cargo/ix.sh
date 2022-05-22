{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mrustc/cargo/unwrap(openssl=1)
{% endblock %}
