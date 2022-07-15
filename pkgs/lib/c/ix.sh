{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if purec %}
lib/{{purec}}
{% else %}
lib/dlfcn
lib/c/bare
{% endif %}
{% endblock %}
