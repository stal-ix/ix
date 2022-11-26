{% extends '//lib/freetype/nohb/ix.sh' %}

{% block bld_libs %}
lib/harfbuzz/ft
lib/freetype/nohb
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
harfbuzz=enabled
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/freetype2 \${CPPFLAGS}"
{% endblock %}
