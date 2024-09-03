{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
tools=disabled
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/libevdev-1.0 \${CPPFLAGS}"
{% endblock %}
