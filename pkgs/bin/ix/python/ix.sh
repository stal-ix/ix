{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/ix/python/scripts
bld/python/frozen(python_ver=12)
{% endblock %}
