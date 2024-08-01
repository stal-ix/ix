{% extends 't/ix.sh' %}

{% block meson_flags %}
{{super()}}
introspection=false
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/gtk-layer-shell \${CPPFLAGS}"
{% endblock %}
