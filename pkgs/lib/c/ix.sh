{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if purec %}
{% if not libc %}
{{shit_happen()}}
{% endif %}
lib/{{purec}}
{% else %}
lib/dlfcn
lib/c/bare
{% endif %}
{% endblock %}
