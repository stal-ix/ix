{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/less/gnu
bin/kitty/next/unwrap(python_ver=12)
{% endblock %}
