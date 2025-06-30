{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
{% if libc_lite %}
lib/musl/pure
{% else %}
lib/{{libc or 'musl/naked'}}
{% endif %}
{% endif %}
{% if darwin %}
lib/darwin/c
{% endif %}
{% if wasi %}
lib/wasi/c
{% endif %}
{% if mingw32 %}
lib/mingw/w64
{% endif %}
{% if freebsd %}
lib/freebsd/c
{% endif %}
{% endblock %}
