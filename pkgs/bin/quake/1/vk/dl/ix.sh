{% extends '//die/dl/fix.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block export_lib %}
c
{% endblock %}

{% block export_symbols %}
pthread_setname_np
{% endblock %}
