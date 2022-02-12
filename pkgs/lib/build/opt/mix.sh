{% extends '//mix/hub.sh' %}

{% block lib_deps %}
{% for o in (opt or 'O2').split(';') %}
lib/build/opt/{{o}}
{% endfor %}
{% endblock %}
