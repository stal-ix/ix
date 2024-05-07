{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python/frozen(python_ver=12)
{% endblock %}
