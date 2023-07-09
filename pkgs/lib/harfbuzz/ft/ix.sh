{% extends '//lib/harfbuzz/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/freetype/nohb
{% endblock %}

{% block meson_flags %}
{{super()}}
cairo=disabled
utilities=disabled
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/harfbuzz \${CPPFLAGS}"
{% endblock %}
