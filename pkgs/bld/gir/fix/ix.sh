{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/xml/lint
bld/gir/fix/scripts
{% endblock %}
