{% extends '//lib/harfbuzz/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/freetype/nohb
{% endblock %}

{% block meson_flags %}
{{super()}}
cairo=disabled
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*util.*||' -i meson.build
{{super()}}
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/harfbuzz \${CPPFLAGS}"
{% endblock %}
