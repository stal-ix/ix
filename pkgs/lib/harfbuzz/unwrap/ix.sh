{% extends '//lib/harfbuzz/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/cairo/bootstrap
lib/freetype/bootstrap
lib/fontconfig/bootstrap
{% endblock %}

{% block meson_flags %}
{{super()}}
utilities=disabled
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/harfbuzz \${CPPFLAGS}"
{% endblock %}
