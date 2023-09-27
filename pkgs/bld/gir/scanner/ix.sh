{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/gir/scanner/unwrap(python_ver=10)
{% endblock %}
