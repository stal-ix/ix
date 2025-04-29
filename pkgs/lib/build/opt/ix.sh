{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% for o in (opt or 'default').split(';') %}
lib/build/opt/{{o}}
{% endfor %}
{% endblock %}
