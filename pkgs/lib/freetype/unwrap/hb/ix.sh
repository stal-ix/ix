{% extends '//lib/freetype/t/ix.sh' %}

{% block bld_libs %}
lib/freetype/bootstrap
lib/harfbuzz/bootstrap
lib/fontconfig/bootstrap
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
