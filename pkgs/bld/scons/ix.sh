{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/scons
bld/python
{% endblock %}
