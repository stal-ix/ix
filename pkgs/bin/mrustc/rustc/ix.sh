{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mrustc/rustc/unwrap(openssl=1)
{% endblock %}
