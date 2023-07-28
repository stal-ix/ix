{% extends '//lib/harfbuzz/t/ix.sh' %}

{% block bld_libs %}
lib/icu
lib/cairo
lib/chafa
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
cairo=enabled
chafa=enabled
{% endblock %}
