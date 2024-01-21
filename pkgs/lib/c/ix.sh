{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if purec %}
{% if not libc %}
{{shit_happen()}}
{% endif %}
lib/{{purec}}
{% else %}
{% if linux and x86_64 %}
lib/asm
{% endif %}
lib/dlfcn
lib/c/bare
{% endif %}
{% endblock %}
