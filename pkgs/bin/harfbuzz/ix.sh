{% extends '//lib/harfbuzz/t/ix.sh' %}

{% block bld_libs %}
lib/cairo
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
cairo=enabled
{% endblock %}
