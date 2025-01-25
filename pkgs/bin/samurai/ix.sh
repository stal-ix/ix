{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/samurai/unwrap(libc_lite=1)
{% endblock %}
