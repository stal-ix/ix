{% extends '//lib/harfbuzz/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/freetype/bootstrap
lib/fontconfig/bootstrap
{% endblock %}

{% block meson_flags %}
{{super()}}
icu=disabled
cairo=disabled
utilities=disabled
{% endblock %}
