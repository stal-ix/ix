{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
tests=disabled
demos=disabled
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/pixman-1 \${CPPFLAGS}"
{% endblock %}
