{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux and libc_lite %}
lib/musl/unwrap
{% else %}
{% if purec %}
{% if not libc %}
{{shit_happen()}}
{% endif %}
lib/{{purec}}
{% else %}
lib/dlfcn
lib/c/bare
{% endif %}
{% endif %}
{% endblock %}
