{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/python
bin/pkg/config/unwrap
bld/pkg/config/wrapped/scripts
{% endblock %}
