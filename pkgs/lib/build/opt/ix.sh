{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% for o in (opt or 'O2;safe').split(';') %}
lib/build/opt/{{o}}
{% endfor %}
{% endblock %}
