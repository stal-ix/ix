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
export FREETYPE_INCLUDES=${out}/include
export CMFLAGS="-DFREETYPE_INCLUDE_DIR=${out}/include \${CMFLAGS}"
export CPPFLAGS="-I${out}/include/freetype2 \${CPPFLAGS}"
{% endblock %}
